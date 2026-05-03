{pkgs, ...}: {
  boot = {
    # Boot loader.
    loader = {
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;

        biosSupport = true;
        efiSupport = true;

        # TODO: Enable secure boot when it's appropiate supported.
        # secureBoot = {
        #   enable = true;
        #   autoGenerateKeys = true;
        #
        #   autoEnrollKeys.enable = true;
        # };
      };
    };

    # Disable kexec to avoid loading untrusted kernels.
    kexec.enable = false;

    plymouth = {
      enable = true;

      font = "${pkgs.raleway}/share/fonts/truetype/Raleway-Regular.ttf";
    };

    kernel.sysctl = {
      # Restrict kernel pointers.
      "kernel.kptr_restrict" = "2";

      # Restrict access to dmesg.
      "kernel.dmesg_restrict" = "1";

      # Disable display kernel log at boot.
      "kernel.printk" = "3 3 3 3";

      # Restrict eBPF.
      "kernel.unprivileged_bpf_disabled" = "1";
      "net.core.bpf_jit_harden" = "2";

      # Restrict loading TTY disciplines.
      "dev.tty.ldisc_autoload" = "0";

      # Restrict userfaultfd syscall.
      "vm.unprivileged_userfaultfd" = "0";

      # Don't load kexec.
      "kernel.kexec_load_disabled" = "1";

      # Restrict sysrq.
      "kernel.sysrq" = "4";

      # Restrict access performance events.
      "kernel.perf_event_paranoid" = "3";

      # Restrict ptrace.
      "kernel.yama.ptrace_scope" = "2";

      # Symlinks only can be followed when outside of a world-readable sticky directory
      "fs.protected_symlinks" = "1";
      "fs.protected_hardlinks" = "1";
    };
  };
}
