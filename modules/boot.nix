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
