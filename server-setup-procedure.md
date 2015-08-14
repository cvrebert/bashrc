(Assumes Ubuntu)

```bash
# bloody timezones
ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
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
```