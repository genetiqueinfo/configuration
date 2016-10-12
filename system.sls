system.pkgs:
  pkg.installed:
    - pkgs:
      - htop
      - ncdu
      - ntp
      - tree

ntp:
  service.running:
    - enable: True
    - require:
      - pkg: system.pkgs

/etc/hostname:
  file.managed:
    - source: salt://hostname
    - user: root
    - mode: 644

/etc/hosts:
  file.managed:
    - source: salt://hosts
    - user: root
    - mode: 644
