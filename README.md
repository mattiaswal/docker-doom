# Docker container to run doom on headless embedded systems
## Infix
Intended to use in [Infix](https://github.com/kernelkit/infix) as
graphical demo use the following config to run on imx8mp-evk:
`
  "infix-containers:containers": {
    "container": [
      {
        "name": "graphic",
        "enabled": true,
        "image": "docker://mattiaswal/alpine-doom:latest",
        "privileged": true,
        "mount": [
          {
            "name": "xorg.conf",
            "content": "U2VjdGlvbiAiU2VydmVyTGF5b3V0IgogICAgSWRlbnRpZmllciAiRGVmYXVsdExheW91dCIKICAgIFNjcmVlbiAwICJTY3JlZW4wIiAwIDAKRW5kU2VjdGlvbgpTZWN0aW9uICJEZXZpY2UiCiAgICBJZGVudGlmaWVyICJpTVggTENEIgogICAgRHJpdmVyICJtb2Rlc2V0dGluZyIKICAgIEJ1c0lEICJwbGF0Zm9ybTozMmZjNjAwMC5kaXNwbGF5LWNvbnRyb2xsZXIiCiAgICBPcHRpb24gImttc2RldiIgIi9kZXYvZHJpL2NhcmQxIgpFbmRTZWN0aW9uCgpTZWN0aW9uICJTY3JlZW4iCiAgICBJZGVudGlmaWVyICJTY3JlZW4wIgogICAgRGV2aWNlICJpTVggTENEIgogICAgRGVmYXVsdERlcHRoIDI0CkVuZFNlY3Rpb24KCg==",
            "target": "/etc/X11/xorg.conf"
          }
        ],
        "volume": [
          {
            "name": "root",
            "target": "/root"
          },
          {
            "name": "udev",
            "target": "/run/udev"
          },
          {
            "name": "var",
            "target": "/var"
          }
        ]
      }
    ]
  },
`
Infix as today (2025-05-07) has a limitation that you can not add
volume mounts from /run/udev on host, to /run/udev in the container,
this limitation makes mouse and keyboard inaccesable in the container.
