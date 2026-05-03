{pkgs, ...}: {
  virtualisation = {
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    virtualbox.host.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };
}
