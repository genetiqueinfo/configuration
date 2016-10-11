arkanosis:
  user.present:
    - home: /home/arkanosis
    - uid: 1301
    - gid: 1301
    - groups:
      - sudo
    - remove_groups: False
    - require:
      - group: arkanosis
  group.present:
    - gid: 1301

/home/arkanosis/.ssh/authorized_keys:
  file.managed:
    - source: salt://users/authorized_keys_arkanosis
    - user: arkanosis
    - mode: 644
    - makedirs: True
    - require:
      - user: arkanosis
