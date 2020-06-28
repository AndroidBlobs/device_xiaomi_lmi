#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:cafe9e905c35c1e9793cf3a1aba88b81372aa9ff; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:134217728:5f642ff661b118b45afbcee3c19e6ea11390f1d1 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:cafe9e905c35c1e9793cf3a1aba88b81372aa9ff && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
