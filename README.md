# distrobox_ftw

Sets up an opinionated development environment for a distrobox container image.

## Minimum Requirements

* Linux
* [docker](https://docs.docker.com/get-docker/)
* [distrobox](https://distrobox.it)

## Quickstart

* clone repo
    ```bash
    git clone https://github.com/pythoninthegrass/distrobox_ftw.git
    cd distrobox_ftw
    ```
* distrobox commands
    ```bash
    # create image
    # ! might need to ctrl-c if it hangs
    # * check `docker logs` for progress 
    distrobox assemble create

    # enter container
    distrobox enter <dev>

    # export a gui app
    distrobox-export -a code

    # export a binary
    distrobox-export -b $(which python)
    
    # exit container
    exit

    # stop container
    distrobox stop <dev>

    # remove image
    distrobox assemble rm
    ```

## Notes

* distrobox home is set to `~/.local/share/distrobox`
* `init_hooks.sh` script may still be mounted to `/tmp` in the final image
* `ssh` is enabled via `systemd` at port 2222
* Exported apps and binaries are in `~/.local/bin`
* When a container is removed, it doesn't automatically remove the exported apps/binaries
  * It should prompt to launch the container, then remove them though

## TODO

* Verify if `init_hooks.sh` is still mounted in final image
* Use ansible playbook for asdf, docker, etc
