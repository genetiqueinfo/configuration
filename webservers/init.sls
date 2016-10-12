include:
  - sources

webservers.pkgs:
  pkg.installed:
    - pkgs:
      - nginx
      - nginx-extras

webservers.pkgs.extras:
  pkg.installed:
    - pkgs:
      - certbot
    - fromrepo: jessie-backports

nginx:
  service.running:
    - watch:
      - pkg: webservers.pkgs
      - file: /etc/nginx/nginx.conf
    - require:
      - pkg: webservers.pkgs

/etc/nginx/site-enabled/default:
  file:
    - absent

/etc/nginx/sites-enabled/blog:
  file.symlink:
    - target: /etc/nginx/sites-available/blog
    - user: root

/etc/nginx/sites-enabled/questions:
  file.symlink:
    - target: /etc/nginx/sites-available/questions
    - user: root

/etc/nginx/sites-enabled/www:
  file.symlink:
    - target: /etc/nginx/sites-available/www
    - user: root

/etc/nginx/sites-available/blog:
  file.managed:
    - source: salt://webservers/blog
    - user: root
    - mode: 644

/etc/nginx/sites-available/questions:
  file.managed:
    - source: salt://webservers/questions
    - user: root
    - mode: 644

/etc/nginx/sites-available/www:
  file.managed:
    - source: salt://webservers/www
    - user: root
    - mode: 644
