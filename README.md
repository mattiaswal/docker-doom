# Docker container to run doom on headless embedded systems
## Infix
Intended to use in [Infix](https://github.com/kernelkit/infix) as
graphical demo use the following config to run on imx8mp-evk:
<pre>
  "infix-containers:containers": {
    "container": [
      {
        "name": "graphic",
        "enabled": true,
        "image": "docker://mattiaswal/alpine-doom:latest",
        "privileged": true,
        "mount": [
          {
            "name": "udev",
            "type": "bind",
            "source": "/run/udev",
            "target": "/run/udev"
          },
          {
            "name": "xorg.conf",
            "content": "U2VjdGlvbiAiU2VydmVyTGF5b3V0IgogICAgSWRlbnRpZmllciAiRGVmYXVsdExheW91dCIKICAgIFNjcmVlbiAwICJTY3JlZW4wIiAwIDAKRW5kU2VjdGlvbgpTZWN0aW9uICJEZXZpY2UiCiAgICBJZGVudGlmaWVyICJpTVggTENEIgogICAgRHJpdmVyICJtb2Rlc2V0dGluZyIKICAgIEJ1c0lEICJwbGF0Zm9ybTozMmZjNjAwMC5kaXNwbGF5LWNvbnRyb2xsZXIiCiAgICBPcHRpb24gImttc2RldiIgIi9kZXYvZHJpL2NhcmQxIgpFbmRTZWN0aW9uCgpTZWN0aW9uICJTY3JlZW4iCiAgICBJZGVudGlmaWVyICJTY3JlZW4wIgogICAgRGV2aWNlICJpTVggTENEIgogICAgRGVmYXVsdERlcHRoIDI0CkVuZFNlY3Rpb24KCg==",
            "target": "/etc/X11/xorg.conf"
          }
        ],
        "volume": [
          {
            "name": "var",
            "target": "/var"
          }
        ]
      }
    ]
  },
</pre>
Add a mouse and keyboard and start playing.

## Building

`docker buildx build --rm --platform linux/amd64,linux/aarch64 -t mattiaswal/alpine-doom -f Dockerfile --push .`
