beadm create be01
beadm mount be01 /tmp/be01/
pkg -R /tmp/be01 uninstall entire
pkg -R /tmp/be01 set-publisher --no-refresh --non-sticky -g /ws/illumos-gate/packages/i386/nightly/repo.redist on-nightly
##pkg -R /tmp/be01 refresh --full
pkg -R /tmp/be01 unset-publisher openindiana.org
pkg -R /tmp/be01 unset-publisher opensolaris.org
pkg -R /tmp/be01 refresh --full
pkg -R /tmp/be01 image-update
beadm list
beadm umount be01
beadm activate be01
