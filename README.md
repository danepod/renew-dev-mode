# Renew LG webOS Developer Mode
This script is a modified version of the automatic renew script generated by [Device/DevMode Manager for webOS TV](https://github.com/webosbrew/dev-manager-desktop).

## Retrieve key
Use Device/Devmode Manager to generate the auto-renewal script. It contains the private key needed to renew the dev mode. Take the key and save it to a file, for example `webos_privkey.key`.

## Build Docker image
Build the Docker image by executing `docker build -t renew-dev-mode .`.

If you intend to use this on a Synology DiskStation, you can now save the image as a tarball, with `docker image save renew-dev-mode -o renew-dev-mode.tar`. This lets you import the image into DSM's Docker GUI. You can then add a scheduled task in the DSM settings to execute `docker start renew-dev-mode --attach` every day (you might need to run the container as `root`.)

## Run Docker container
Make sure to mount the directory containing the key file as `/config` (or change the `PRIV_KEY_FILE`.) You must at least set the `DEVICE_HOST` and `DEVICE_PASSPHRASE` variables according to the values shown by your TV.

`docker run --mount type=bind,source="$(pwd)",target=/config --env DEVICE_HOST=192.168.x.x --env DEVICE_PASSPHRASE="passphrase" renew-dev-mode`