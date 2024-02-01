# dnsmasq

Dnsmasq provides network infrastructure for small networks: DNS, DHCP, router advertisement and network boot. It is designed to be lightweight and have a small footprint, suitable for resource constrained routers and firewalls. It has also been widely used for tethering on smartphones and portable hotspots, and to support virtual networking in virtualisation frameworks. Supported platforms include Linux (with glibc and uclibc), Android, *BSD, and Mac OS X. Dnsmasq is included in most Linux distributions and the ports systems of FreeBSD, OpenBSD and NetBSD. Dnsmasq provides full IPv6 support.

## Replace systemd-resolved by dnsmasq

Tested on:

- Ubuntu 20.04

### Instructions

So that `systemd-resolved` does not block port 53 anymore we have to configure it do so in `/etc/systemd/resolved.conf`:

```txt
# /etc/systemd/resolved.conf
[Resolve]
DNSStubListener=no
```

```bash
git clone https://github.com/patricklubach/homelab.git
cd homelab/dnsmasq/


sudo systemctl stop systemd-resolved
# sudo systemctl disable systemd-resolved # optional

sudo apt update
sudo apt install dnsmasq
sudo systemctl enable dnsmasq

sudo cp -f dnsmasq.conf /etc/dnsmasq.conf
sudo cp -f dnsmasq.d/homelab.internal.conf /etc/dnsmasq.d/homelab.internal.conf

sudo systemctl stop dnsmasq
sudo systemctl start dnsmasq
```

Check that dnsmasq is running and works as expected:

```bash
sudo systemctl status dnsmasq

dig homelab.internal NS
dig foo.homelab.internal
```

You can check that it works after restart, reboot your system and try again.

## Sources

- [dnsmasq manpage](https://thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html)
