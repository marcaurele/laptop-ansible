# Ansible playbook to configure my laptops

This playbook is my laptop's configuration for both private and work, running
Debian ~~or Ubuntu~~ distributions. It is based on:

- i3
- fish shell
- development for:
  - Python
  - Golang
  - Rust
  - Terraform, Consul, Nomad, Vault

Command shortcuts are available with a [Taskfile](https://taskfile.dev/), see `task` to list them all.

Its goal is to keep all my configurations and system state under this playbook in order to restore a working laptop within less than 1 hour.

See status of todos in the [issues](https://github.com/marcaurele/laptop-ansible/issues).

## Run the installation

You should install the base OS with a SSH server and run the playbook from
another host initially which will create the user. After the 1st run, you can
run the `update.sh` script from the user home.

```console
task local
```

## Test on vagrant box

```console
task vagrant
```

## Get current host facts

```console
task facts
```

## LUKFS & LVM

To customize the LUKFS and LVM setup, the disk should be laid out using a live
CD before performing the installation. After booting on the live CD:

1. Partition the disk for:
   - EFI volume (~500MB) + bootable flag. If there is an existing partition, it must be first deleted to avoid an error message.
   - /boot (~700MB) using ext2 (no need for journaled FS) without the bootable flag
   - a single partition with the rest to crypt
2. Create the LUKS container: `cryptsetup luksFormat /dev/nvmen0p3`
   (see to change defaults)
3. Open the container: `cryptsetup luksOpen /dev/nvmen0p3 cryptlvm`
4. Create a physical volume on top of the opened LUKFS container:
   `pvcreate /dev/mapper/cryptlvm`
5. Create a volume group: `vgcreate vglaptop /dev/mapper/cryptlvm`
6. Create the logical volumes for `/root`, `/home`...:
   - `lvcreate -L 70G vglaptop -n root`
   - `lvcreate -L 16G vglaptop -n swap` (A little extra than the physical memory)
   - `lvcreate -l 100%FREE vglaptop -n home`
7. Format the filesystems:
   - `mkfs.ext4 /dev/vglaptop/root`
   - `mkfs.ext4 /dev/vglaptop/home`
   - `mkswap /dev/vglaptop/swap`
8. Install the system on the corresponding mount points
9. Perform those operations to configure the LUKS opening from the live CD:
   - `mount /dev/vglaptop/root /mnt`
   - `mount /dev/vglaptop/home /mnt/home`
   - `mount /dev/nvmen0p2 /mnt/boot`
   - `mount --bind /dev /mnt/dev`
   - `mount --bind /run/lvm /mnt/run/lvm`
   - `mount /dev/nvmen0p1 /mnt/boot/efi` (EFI partition)
   - `chroot /mnt`
10. From inside the chroot partition:
    - `mount -t proc proc /proc`
    - `mount -t sysfs sys /sys`
    - `mount -t devpts devpts /dev/pts`
11. Setup crypttab (grep uuid from `blkid | grep LUKS`):
    ``echo "cryptlvm `blkid| grep LUK | awk -F '"' '{printf "UUID=" $2}'`none luks" > /etc/crypttab``
12. Rebuild boot files:
    - `update-initramfs -c -k all`
    - `update-grub` or `grub-mkconfig -o /boot/grub/grub.cfg`

In case there's some info on [Archlinux - LVM on
LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS).

## VPN connection

### WireGuard

To create the set of keys:

```console
wg genkey | tee vpn-client-private.key | wg pubkey > vpn-client-public.key
```

To import connection in the NetworkManager:

```console
nmcli connection import type wireguard file <file.conf>
```

### AWS IP ranges in routes

To add the AWS network ranges to go through the VPN, download the latest
file at <https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html>.
Insert them in the VPN entry with:

```console
# IPv4
curl --silent https://ip-ranges.amazonaws.com/ip-ranges.json \
  | jq -r '.prefixes | .[].ip_prefix' \
  | tr '\n' ',' \
  | sed 's/,$//' \
  | xargs nmcli connection modify <vpn-name> ipv4.routes

# IPv6
curl --silent https://ip-ranges.amazonaws.com/ip-ranges.json \
  | jq -r '.ipv6_prefixes | .[].ipv6_prefix' \
  | tr '\n' ',' \
  | sed 's/,$//' \
  | xargs nmcli connection modify <vpn-name> ipv6.routes
```

## Alternatives

### Desktop

The default desktop is i3, but if it seems too _raw_, there's an alternative easier to
use: <https://regolith-linux.org/>.

## Bluetooth pairing

To pair with a device:

```console
bluetoothctl
devices
pair A8:5B:78:A0:37:48
<confirm the code>
trust A8:5B:78:A0:37:48
```

_To pair with the MX Ergo, don't open the BT manager but do everything from the command line._

## Tips

- For Debian codename changes, run once `sudo apt-get update --allow-releaseinfo-change` to accept the change to the next version.

## Notes

### Dell XPS 15

- <https://github.com/cloudxabide/Dell_XPS15_9520_Linux>
- <https://wiki.debian.org/NvidiaGraphicsDrivers>
- <https://github.com/bayasdev/envycontrol>
- <https://wiki.archlinux.org/title/Bumblebee#Installation>
- <https://wiki.archlinux.org/title/NVIDIA_Optimus>
- <https://wiki.archlinux.org/title/Dell_XPS_15>
