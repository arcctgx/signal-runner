# signal-runner

Container image for running signal-desktop on older systems that don't
support latest versions of Electron framework.

This is pretty much a "because I can" experiment for my own learning and
amusement, motivated by dislike of time-bombed software.

## Usage

```text
make image
docker-compose up
```

Use `docker container prune` to clean up stopped containers after exiting
signal-desktop.

## Restrictions

* Clicking URLs doesn't open them in host web browser.
* Tray icon doesn't work in some desktop environments.
* UID and GID are hardcoded to 1000 and 100, respectively.
* Sound doesn't work (but it can probably be configured).

## Useful links

<https://dzone.com/articles/docker-x11-client-via-ssh>
