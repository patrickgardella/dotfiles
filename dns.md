# DNS Configuration

All clients should use the two Pi-hole servers as their DNS resolvers.

## Pi-hole servers

| Server    | IPv4            | IPv6                                      |
|-----------|-----------------|-------------------------------------------|
| Primary   | `192.168.4.53`  | `fdd9:6250:9437:1:12ff:e0ff:fec3:ba65`    |
| Secondary | `192.168.4.153` | `fdd9:6250:9437:1:daee:cff9:5e83:6ac5`    |

Search domain: `thetelos.com`

Source: the "Wired connection" profile on this Linux machine (NetworkManager),
with automatic DNS ignored so only these servers are used.

> **Tailscale note:** On machines running Tailscale with "Use Tailscale DNS"
> enabled, `/etc/resolv.conf` points at `100.100.100.100` (MagicDNS), and
> Tailscale forwards queries to the tailnet's configured resolver. To use the
> Pi-holes directly on such a machine, either add them as a nameserver in the
> Tailscale admin console (DNS settings) or run `tailscale set --accept-dns=false`.

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

### NetworkManager (nmcli)
This is how this machine is configured. Replace `"Wired connection"` with your
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

Verify: `resolvectl status` (or `nmcli dev show | grep DNS`) and `dig example.com`.

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
