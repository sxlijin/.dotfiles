# Usage

* `init.sh` sets everything up
* `update.sh` updates dependencies here

## Machine Config

Bringing up a new Arch VM (in vbox) can be done as follows:

1. Get an Arch live disk.
1. Use the [`init.sh` script to bring the system up](https://gist.github.com/sxlijin/be5611f484aeb67fb3fe226426f9d941).
    * Default login is `pockets:hunter123`. Should use `passwd` to change this on first login.
1. Set up networking:
    1. Add 2 NIC's: one on NatNetwork, one on Host-only.
    1. Set up udev rules.
    1. Set up systemd-networkd rules.
    1. Enable and start `systemd-networkd`.
    1. Symlink `/etc/resolv.conf` and enable and start `systemd-resolved`.

