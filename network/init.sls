network.pkgs:
  pkg.installed:
    - pkgs:
      - curl
      - libpam-google-authenticator
      - openssh-client
      - openssh-server

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://network/sshd_config
    - mode: 644

/etc/pam.d/sshd:
  file.managed:
    - source: salt://network/pam.d_sshd
    - mode: 644
