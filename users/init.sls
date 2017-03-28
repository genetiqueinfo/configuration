include:
  - term
  - vcs

root:
  user.present:
    - shell: /usr/bin/zsh
    - require:
      - pkg: term.pkgs
      - pkg: vcs.pkgs

arkonf:
  git.latest:
    - name: "https://github.com/Arkanosis/Arkonf.git"
    - rev: master
    - target: /srv/Arkonf
    - user: root

arkanosis:
  user.present:
    - home: /home/arkanosis
    - shell: /usr/bin/zsh
    - uid: 1301
    - gid: 1301
    - groups:
      - sudo
    - remove_groups: False
    - require:
      - group: arkanosis
      - pkg: term.pkgs
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

/home/arkanosis/.zshrc:
  file.symlink:
    - target: /srv/Arkonf/zsh/.zshrc
    - user: arkanosis

/home/arkanosis/.zsh:
  file.symlink:
    - target: /srv/Arkonf/zsh/.zsh
    - user: arkanosis

/home/arkanosis/.emacs:
  file.symlink:
    - target: /srv/Arkonf/emacs/.emacs
    - user: arkanosis

/home/arkanosis/.emacs.d:
  file.symlink:
    - target: /srv/Arkonf/emacs/.emacs.d
    - user: arkanosis

asdp:
  user.present:
    - home: /home/asdp
    - shell: /usr/bin/zsh
    - uid: 1401
    - gid: 1401
    - remove_groups: False
    - makedirs: True
    - require:
      - group: asdp
      - pkg: term.pkgs
  group.present:
    - gid: 1401

/home/asdp/.ssh/authorized_keys:
  file.managed:
    - source: salt://users/authorized_keys_asdp
    - user: asdp
    - mode: 644
    - require:
      - user: asdp

/root/.ssh/authorized_keys:
  file.managed:
    - source: salt://users/authorized_keys_root
    - user: root
    - mode: 644

/root/.zshrc:
  file.symlink:
    - target: /srv/Arkonf/zsh/.zshrc
    - user: root

/root/.zsh:
  file.symlink:
    - target: /srv/Arkonf/zsh/.zsh
    - user: root

/root/.emacs:
  file.symlink:
    - target: /srv/Arkonf/emacs/.emacs
    - user: root

/root/.emacs.d:
  file.symlink:
    - target: /srv/Arkonf/emacs/.emacs.d
    - user: root
