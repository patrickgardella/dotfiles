# DNS Configuration

All clients should use the two Pi-hole servers as their DNS resolvers.

## Pi-hole servers

| Server    | IPv4            | IPv6                                      |
|-----------|-----------------|-------------------------------------------|
| Primary   | `192.168.4.53`  | `fdd9:6250:9437:1:12ff:e0ff:fec3:ba65`    |
| Secondary | `192.168.4.153` | `fdd9:6250:9437:1:daee:cff9:5e83:6ac5`    |

Search domain: `thetelos.com`

Configure each client to use only these servers (ignore DHCP-provided DNS),
using the section for your platform below.

> **Tailscale note:** On machines running Tailscale with "Use Tailscale DNS"
> enabled, `/etc/resolv.conf` points at `100.100.100.100` (MagicDNS), and
> Tailscale forwards queries to the tailnet's configured resolver. To use the
> Pi-holes directly on such a machine, run `tailscale set --accept-dns=false`
> (or add them as a nameserver in the Tailscale admin console).
>
> **glibc limit:** The libc resolver only uses the first 3 `nameserver` lines
> in `/etc/resolv.conf`, so on Linux the 4th server (secondary IPv6) is ignored
> by most applications even though it is configured. List the servers in the
> order primary IPv4, secondary IPv4, primary IPv6, secondary IPv6 so the
> important ones fall within the limit.

---

## macOS

### GUI
1. System Settings → **Network** → select your active connection (Wi-Fi or Ethernet) → **Details…**
2. Open the **DNS** tab.
3. Under **DNS Servers**, remove existing entries and click **+** to add:
   - `192.168.4.53`
   - `192.168.4.153`
   - `fdd9:6250:9437:1:12ff:e0ff:fec3:ba65`
   - `fdd9:6250:9437:1:daee:cff9:5e83:6ac5`
4. Under **Search Domains**, add `thetelos.com`.
5. Click **OK**, then **Apply**.

### Command line
macOS takes IPv4 and IPv6 servers in the same list. List services with
`networksetup -listallnetworkservices`, then:

```sh
sudo networksetup -setdnsservers "Wi-Fi" \
  192.168.4.53 192.168.4.153 \
  fdd9:6250:9437:1:12ff:e0ff:fec3:ba65 fdd9:6250:9437:1:daee:cff9:5e83:6ac5
sudo networksetup -setsearchdomains "Wi-Fi" thetelos.com
```

Verify and flush the cache:

```sh
networksetup -getdnsservers "Wi-Fi"
scutil --dns
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

To revert to DHCP-provided DNS: `sudo networksetup -setdnsservers "Wi-Fi" Empty`

---

## Linux

First find out what manages DNS: `ls -l /etc/resolv.conf`, or check which of
NetworkManager, systemd-resolved or dhcpcd is running. Then use the matching
section below.

### NetworkManager (nmcli)
Replace `"Wired connection"` with your
profile name (`nmcli con show`).

```sh
nmcli con mod "Wired connection" \
  ipv4.ignore-auto-dns yes \
  ipv4.dns "192.168.4.53,192.168.4.153" \
  ipv4.dns-search "thetelos.com" \
  ipv6.ignore-auto-dns yes \
  ipv6.dns "fdd9:6250:9437:1:12ff:e0ff:fec3:ba65,fdd9:6250:9437:1:daee:cff9:5e83:6ac5"
nmcli con up "Wired connection"
```

### dhcpcd (e.g. Debian without NetworkManager)
In `/etc/dhcpcd.conf`, set (replacing any existing `static domain_name_servers`):

```
static domain_name_servers=192.168.4.53 192.168.4.153 fdd9:6250:9437:1:12ff:e0ff:fec3:ba65 fdd9:6250:9437:1:daee:cff9:5e83:6ac5
static domain_search=thetelos.com
```

Then rebind: `sudo dhcpcd -n <interface>` (or `sudo systemctl restart dhcpcd`).
dhcpcd regenerates `/etc/resolv.conf`; the router's IPv6 address may still be
appended after the Pi-holes, which is harmless.

### systemd-resolved (without NetworkManager)
Edit `/etc/systemd/resolved.conf`:

```ini
[Resolve]
DNS=192.168.4.53 192.168.4.153 fdd9:6250:9437:1:12ff:e0ff:fec3:ba65 fdd9:6250:9437:1:daee:cff9:5e83:6ac5
Domains=thetelos.com
```

Then `sudo systemctl restart systemd-resolved`.

### Static /etc/resolv.conf
Only if nothing else manages the file:

```
nameserver 192.168.4.53
nameserver 192.168.4.153
nameserver fdd9:6250:9437:1:12ff:e0ff:fec3:ba65
nameserver fdd9:6250:9437:1:daee:cff9:5e83:6ac5
search thetelos.com
```

Verify: `cat /etc/resolv.conf`, `resolvectl status` or `nmcli dev show | grep DNS`,
and `dig example.com` (the `SERVER:` line should show a Pi-hole).

---

## Windows

### GUI
1. Settings → **Network & internet** → your adapter (Wi-Fi or Ethernet) → **Hardware properties** → **DNS server assignment** → **Edit**.
2. Set to **Manual**, enable **IPv4**, and enter:
   - Preferred: `192.168.4.53`
   - Alternate: `192.168.4.153`
3. Enable **IPv6** and enter:
   - Preferred: `fdd9:6250:9437:1:12ff:e0ff:fec3:ba65`
   - Alternate: `fdd9:6250:9437:1:daee:cff9:5e83:6ac5`
4. Click **Save**.

### PowerShell (run as Administrator)
Find the adapter name with `Get-NetAdapter`, then:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses `
  "192.168.4.53","192.168.4.153", `
  "fdd9:6250:9437:1:12ff:e0ff:fec3:ba65","fdd9:6250:9437:1:daee:cff9:5e83:6ac5"
Set-DnsClient -InterfaceAlias "Ethernet" -ConnectionSpecificSuffix "thetelos.com"
```

Verify and flush the cache:

```powershell
Get-DnsClientServerAddress -InterfaceAlias "Ethernet"
Clear-DnsClientCache
```

To revert to DHCP-provided DNS: `Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ResetServerAddresses`

---

## Testing

From any platform, confirm queries reach the Pi-holes:

```sh
nslookup example.com 192.168.4.53
nslookup example.com 192.168.4.153
nslookup example.com fdd9:6250:9437:1:12ff:e0ff:fec3:ba65
nslookup example.com fdd9:6250:9437:1:daee:cff9:5e83:6ac5
```

A known ad domain (e.g. `doubleclick.net`) should return `0.0.0.0` or NXDOMAIN
when blocked by Pi-hole.
