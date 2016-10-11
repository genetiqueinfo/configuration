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
