network.pkgs:
  pkg.installed:
    - pkgs:
      - curl
      - libpam-google-authenticator
      - openssh-client
      - openssh-server

/etc/network/interfaces:
  file.managed:
    - source: salt://network/interfaces
    - mode: 644

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://network/sshd_config
    - mode: 644

/etc/pam.d/sshd:
  file.managed:
    - source: salt://network/pam.d_sshd
    - mode: 644
