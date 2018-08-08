To build the docker image manually:

```
docker build -t txpipe .
```

To execute txpipe within the docker image:
```
docker run -v "$PWD":/usr/src/project -w /usr/src/project -it txpipe ceci test/test.ym
```
