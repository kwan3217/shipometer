# Ansible for Shipometer

## Before first boot

Use `rpi-imager`. 

### Older `rpi-image` (<2.0.3)

1. Get an image that does Debian 12 (Bookworm) not Debian 13 (Trixie)
    * Raspberry Pi OS (Other) -> Raspberry Pi OS (Legacy, 64-bit) Lite
2. Eject MicroSD card from fluttershy and insert it in SD card reader attached to Celestia. 
3. Edit settings
    * General
      * [x] Set Hostname: `fluttershy`.local
      * [x] Set username and password:
         * Username: `chrisj`
         * Password: ******
      * [ ] Configure wireless LAN
      * [x] Set locale settings:
         * Time Zone: `America/Chicago` or as appropriate 
         * Keyboard layout: `us`
    * Services
       * [x] Enable SSH
          * ( ) Use password authentication
          * (*) Allow public-key authentication only
             * Set authorized_keys for `chrisj`: `<copy and paste from first line of /home/chrisj/.ssh/id_rsa.pub>` 
    * Options
      * [ ] Play sound when finished
      * [x] Eject media when finished
      * [ ] Enable telemetry

### Newer `rpi-image` (2.0.3)
1. Select the device type -- Raspberry Pi 5 for the current `fluttershy`
2. Raspberry Pi OS (Other) -> Raspberry Pi OS (Legacy, 64-bit) Lite
3. Insert and select the correct medium -- it is often already mounted
   as `/media/chrisj/devicename`. It is CRITICALLY IMPORTANT to get this right 
   -- check that the file size matches what is expected, and that it isn't
   one of your existing drives on the host filesystem. The check box [x] Exclude System Drives
   helps with this.
4. Set the hostname `fluttershy` not `fluttershy.local` or `fluttershy.kwansystems.org`
5. Set the capital city, time zone, and keyboard layout.
6. Set the user name `chrisj` and the password `<SECRET>`
7. Skip wifi for now
8. Enable SSH
   * ( ) Use Password Authentication
   * (*) Use public key authentication
      * Set authorized_keys for `chrisj`: `<copy and paste from first line of /home/chrisj/.ssh/id_rsa.pub>` 

### Write the image
Continue until the program writes the image on the card. Writing the image will take a few minutes.

## SSH host identity
Eject the card but then plug it back into the host. Run this:

```
sudo cp -av /mnt/big/backups/fluttershy/2025-12-15/etc/ssh/ssh_host_* /media/chrisj/rootfs/etc/ssh/
```

Edit the file `/media/chrisj/rootfs/usr/lib/raspberrypi-sys-mods/firstboot` and comment out the lines about
recalculating the host identity:
```
main () {
  get_variables

  # whiptail --infobox "Generating SSH keys..." 20 60
  # regenerate_ssh_host_keys
```

## Boot new card in Fluttershy
Eject the card again, move it back to Fluttershy, and boot it.

Unmount and remove the card from the host and install it in a powered-off or red light Raspberry Pi 5.
Start it back up and wait for it to respond to pings. The router (Megumu)
knows Fluttershy's MAC address and will assign it the known IP `192.168.217.102`
and name `fluttershy.kwansystems.org`
