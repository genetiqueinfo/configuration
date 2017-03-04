network.pkgs:
  pkg.installed:
    - pkgs:
      - curl
      - openssh-client
      - openssh-server

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://network/sshd_config
    - mode: 644
