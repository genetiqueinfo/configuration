# genetique.info

## Deployment as root on Debian

```sh
apt install salt-minion git
mkdir -p /srv
git clone https://github.com/genetiqueinfo/configuration.git /srv/salt
apt update
salt-call --local state.highstate
apt upgrade
reboot now
```

## HTTPS setup

```sh
service nginx stop
certbot certonly --standalone -d genetique.info -d blog.genetique.info -d questions.genetique.info -d www.genetique.info
service nginx start
```

## Biostar setup

This is a light setup using Django's runserver behind an nginx reverse proxy. It's very simple to deploy, but wouldn't scale if we had a lot of users.

```sh
su biostar
cd
git clone https://github.com/ialbert/biostar-central.git
cd biostar-central
pip install --user --upgrade -r conf/requirements/base.txt
# edit live/staging.env & biostar/settings/base.py
./biostar.sh init run
```
