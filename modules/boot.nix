{
  boot = {
    # Boot loader.
    loader = {
      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Disable kexec to avoid loading untrusted kernels.
    kexec.enable = false;
  };
}
