(Assumes Ubuntu)

```bash
# bloody timezones
ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
# setup firewall
ufw default allow outgoing
ufw default deny incoming
ufw allow ssh
ufw allow www
ufw enable
ufw status verbose
# remove useless junk
aptitude remove \
    ppp \
    pppconfig \
    pppoeconf \
    laptop-detect \
    language-pack-gnome-en \
    language-pack-gnome-en-base \
    libcgi-fast-perl \
    libcgi-pm-perl \
    libfcgi-perl \
    ntfs-3g \
    telnet \
    libx11-6 \
    libx11-data \
    libxau6 \
    libxcb1 \
    libxdmcp6 \
    libxext6 \
    libxmuu1 \
    xauth
#    crda \
#    iw \
#    wireless-regdb \

# setup nginx; user = www-data
aptitude install nginx-light
rm /etc/nginx/sites-enabled/default
mkdir /var/www/empty
chmod -w /var/www/empty
nano -w /etc/nginx/sites-available/w3bug.com
ln -s /etc/nginx/sites-available/w3bug.com /etc/nginx/sites-enabled/
service nginx restart
```
