beadm destroy -F ufbt
beadm create ufbt
beadm mount ufbt /tmp/ufbt/
pkg -R /tmp/ufbt uninstall entire
pkg -R /tmp/ufbt set-publisher --no-refresh --non-sticky -g /ws_ufbt/illumos-gate/packages/i386/nightly/repo.redist on-nightly
##pkg -R /tmp/ufbt refresh --full
pkg -R /tmp/ufbt unset-publisher openindiana.org
pkg -R /tmp/ufbt unset-publisher opensolaris.org
pkg -R /tmp/ufbt refresh --full
pkg -R /tmp/ufbt image-update
beadm list
beadm umount ufbt
beadm activate ufbt
