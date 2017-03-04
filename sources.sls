deb http://ftp.debian.org/debian jessie-backports main:
  pkgrepo.managed:
    - dist: jessie-backports
    - file: /etc/apt/sources.list.d/backports.list

deb http://security.debian.org/ jessie/updates main:
  pkgrepo.managed:
    - dist: jessie/updates
    - file: /etc/apt/sources.list.d/security.list
