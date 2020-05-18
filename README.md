# Arch Ren'Py Build

[![Man Hours](https://img.shields.io/endpoint?url=https%3A%2F%2Fjessemillar-man-hours.herokuapp.com%2Fhours%3Frepo%3Dhttps%3A%2F%2Fgithub.com%2Fjessemillar%2Farch-renpy-build.git)](https://github.com/jessemillar/man-hours)

A minimal Docker image for [Ren'Py visual novel engine](https://www.renpy.org/) build automation. Uses [`renutil`](https://github.com/kobaltcore/renutil) for Ren'Py installation/usage and includes [the itch.io butler](https://itch.io/docs/butler/) and [ghr](https://github.com/tcnksm/ghr) for publishing releases to GitHub and [itch.io](https://itch.io).

Docker image is available on DockerHub as [jessemillar/arch-renpy-build](https://hub.docker.com/r/jessemillar/arch-renpy-build/).

See [this file for example usage](https://github.com/jessemillar/arch-renpy-build/blob/master/examples/.circleci/config.yml).
