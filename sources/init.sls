/etc/apt/preferences:
  file.managed:
    - source: salt://sources/apt-preferences
    - mode: 644

deb http://ftp.debian.org/debian stretch-backports main:
  pkgrepo.managed:
    - dist: stretch-backports
    - file: /etc/apt/sources.list.d/backports.list

deb http://security.debian.org/ stretch/updates main:
  pkgrepo.managed:
    - dist: stretch/updates
    - file: /etc/apt/sources.list.d/security.list
