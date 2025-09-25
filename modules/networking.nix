{
  networking = {
    hostName = "alex-linux"; # Define your hostname.

    extraHosts = ''
      74.208.153.157 my-vpn
    '';
  };

  programs.openvpn3.enable = true;

  services.openvpn.servers = {
    homeVPN = {
      config = ''config /root/vpn/alex-pc.ovpn'';
      updateResolvConf = false;
      autoStart = true;
    };
  };
}
