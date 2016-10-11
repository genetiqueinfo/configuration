# genetique.info

## Deployment as root on Debian

```sh
apt install salt-minion git
mkdir -p /srv
git clone https://github.com/genetiqueinfo/configuration.git /srv/salt
apt update
salt-call --local state.highstate
apt ugrade
```
