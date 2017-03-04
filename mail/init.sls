mail.pkgs:
  pkg.installed:
    - pkgs:
      - heirloom-mailx
      - ssmtp

/etc/ssmtp/ssmtp.conf:
  file.managed:
    - source: salt://mail/ssmtp.conf
    - mode: 640

/etc/ssmtp/revaliases:
  file.managed:
    - source: salt://mail/revaliases
    - mode: 640
