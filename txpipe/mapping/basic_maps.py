from ..utils import choose_pixelization, HealpixScheme, GnomonicPixelScheme, ParallelStatsCalculator
import numpy as np

class Mapper:
    def __init__(self, pixel_scheme, lens_bins, source_bins, tasks=(0,1,2)):
        self.pixel_scheme = pixel_scheme
        self.source_bins = source_bins
        self.lens_bins = lens_bins
        self.tasks = tasks
        self.stats = {}
        for b in self.lens_bins:
            t = 0
            self.stats[(b,t)] = ParallelStatsCalculator(self.pixel_scheme.npix)

        for b in self.source_bins:
            for t in [1,2]:
                self.stats[(b,t)] = ParallelStatsCalculator(self.pixel_scheme.npix)

    def add_data(self, shear_data, bin_data, m_data):
        npix = self.pixel_scheme.npix

        # Get pixel indices
        pix_nums = self.pixel_scheme.ang2pix(shear_data['ra'], shear_data['dec'])

        # TODO: change from unit weights for lenses
        lens_weights = np.ones_like(shear_data['ra'])

        # In advance make the mask indicating which tomographic bin
        # Each galaxy is in.  Later we will AND this with the selection
        # for each pixel.
        masks_lens = [bin_data['lens_bin'] == b for b in self.lens_bins]
        masks_source = [bin_data['source_bin'] == b for b in self.source_bins]

        for p in np.unique(pix_nums):  # Loop through pixels
            if p < 0 or p >= npix:
                continue

            # All the data points that hit this pixel
            mask_pix = (pix_nums == p)

            # Number counts.
            t = 0
            if t in self.tasks:
                # Loop through the tomographic lens bins
                for i,b in enumerate(self.lens_bins):
                    mask_bins = masks_lens[i]
                    w = lens_weights
                    # Loop through tasks (number counts, gamma_x)
                    self.stats[(b,t)].add_data(p, w[mask_pix & mask_bins])

            # Shears
            for t in (1,2):
                # We may be skipping tasks in future
                if not t in self.tasks:
                    continue
                # Loop through tomographic source bins
                for i,b in enumerate(self.source_bins):
                    mask_bins = masks_source[i]
                    w = shear_data[f'mcal_g{t}']
                    self.stats[(b,t)].add_data(p, w[mask_pix & mask_bins])


    def finalize(self, comm=None):
        ngal = {}
        g1 = {}
        g2 = {}
        var_g1 = {}
        var_g2 = {}

        rank = 0 if comm is None else comm.Get_rank()

        # TODO: support sparse
        pixel = np.arange(self.pixel_scheme.npix)

        is_master = (comm is None) or (comm.Get_rank()==0)
        for b in self.lens_bins:
            if rank==0:
                print(f"Collating density map for lens bin {b}")
            stats = self.stats[(b,0)]
            count, mean, _ = stats.collect(comm)

            if not is_master:
                continue

            count[np.isnan(count)] = 0
            mean[np.isnan(mean)] = 0

            count = count.reshape(self.pixel_scheme.shape)
            mean = mean.reshape(self.pixel_scheme.shape)

            ngal[b] = (mean * count).flatten()

        for b in self.source_bins:
            if rank==0:
                print(f"Collating shear map for source bin {b}")
            stats_g1 = self.stats[(b,1)]
            stats_g2 = self.stats[(b,2)]
            count_g1, mean_g1, v_g1 = stats_g1.collect(comm)
            count_g2, mean_g2, v_g2 = stats_g2.collect(comm)

            if not is_master:
                continue

            # Convert variance of value to variance of mean,
            # Since that is what we want for noise estimation
            v_g1 /= count_g1
            v_g2 /= count_g2

            #  Don't think we want to save these at the moment
            del count_g1
            del count_g2

            mean_g1[np.isnan(mean_g1)] = 0
            mean_g2[np.isnan(mean_g2)] = 0


            v_g1[np.isnan(v_g1)] = 0
            v_g2[np.isnan(v_g2)] = 0

            mean_g1 = mean_g1.reshape(self.pixel_scheme.shape)
            mean_g2 = mean_g2.reshape(self.pixel_scheme.shape)

            v_g1 = v_g1.reshape(self.pixel_scheme.shape)
            v_g2 = v_g2.reshape(self.pixel_scheme.shape)

            g1[b] = mean_g1.flatten()
            g2[b] = mean_g2.flatten()
            
            var_g1[b] = v_g1.flatten()
            var_g2[b] = v_g2.flatten()

        return pixel, ngal, g1, g2, var_g1, var_g2


