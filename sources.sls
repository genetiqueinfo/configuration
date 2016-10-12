deb http://ftp.debian.org/debian jessie-backports main:
  pkgrepo.managed:
    - dist: jessie-backports
    - file: /etc/apt/sources.list.d/backports.list
