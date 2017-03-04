asdp:
  user.present:
    - home: /home/asdp
    - uid: 1201
    - gid: 1201
    - remove_groups: False
    - makedirs: True
    - require:
      - group: asdp
  group.present:
    - gid: 1201

/home/asdp/.ssh/authorized_keys:
  file.managed:
    - source: salt://users/authorized_keys_asdp
    - user: asdp
    - mode: 644
    - require:
      - user: asdp

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

/root/.ssh/authorized_keys:
  file.managed:
    - source: salt://users/authorized_keys_root
    - user: root
    - mode: 644
