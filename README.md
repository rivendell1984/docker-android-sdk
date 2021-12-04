Android SDK Docker Image
========================


This project aims to provide a docker image that contains android sdk.

Build it
--------


To build it, simply run:

```bash
$> docker build --build-arg ANDROID_BUILD_TOOLS_VERSION=31.0.0 -t docker-android-sdk:31.0.0 .
```

Run it
------

 To run the previously built image, runs bash for example

```bash
$> docker run -it --rm -v $SOURCE_DIRECTORY:/sources -w /sources docker-android-sdk:31.0.0 bash
```

