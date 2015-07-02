# docker-ubuntu-scikit-numpy
Dockerfile to automate build of ubuntu-scikit-numpy ready image on Docker Hub


All requirements in https://github.com/catholabs/docker-ubuntu-scikit-numpy/blob/master/requirements.txt installed along with apt-get dependencies listed in Dockerfile

usage:

```
docker run -i -t catholabs/docker-ubuntu-scikit-numpy python -c "print('Hello World')"
```

or from a new build

```
FROM catholabs/docker-ubuntu-scikit-numpy
RUN anything
CMD python myscript.py
```

