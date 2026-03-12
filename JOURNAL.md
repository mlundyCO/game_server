## 2026-03-11:
- From the phone hosting the wifi hotspot, the IP address of the hotspot host
    can be found with `ifconfig`, but more testing needed to see exactly
    where this IP address shows up depending on the connection status
    of the host (is host connected to a internet accessible wifi network?,
    is host connected to a internet accesible cell network? is
    host offline except for the hotspot?)
- From the phones connecting to the wifi hotspot: you can discover
    the IP address of the host sometimes using `ip neigh`
- Different version of Android affect what permissions Termux has.
    `ip neigh` works from pixel3a, but not from pixel7
- Some `awk` gymnastics to scrape the hotspot ip from `ifconfig`.
- Created script to start webserver and added a QR code generator so host
    URL is a little easier to communicate
- Made a termux widget on pixel7 to launch the whole thing!

## 2026-03-12:
- Changed file in `~/.shortcuts` to redirect to script in project directory,
    and edited script to resolve to project directory
- Added border around join URL

ROADMAP: look into https, consider programming games/chat/filesharing?
