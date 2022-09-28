#version=F36
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-36&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f36&arch=x86_64" --cost=0
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-36&arch=x86_64"
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-36&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-36&arch=x86_64"
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-36&arch=x86_64" --cost=0
# Use graphical install
graphical --non-interactive

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

%packages
@^workstation-product-environment

%end

# Run the Setup Agent on first boot
firstboot --disable

# Generated using Blivet version 3.4.3
# $=nvme0n1|sda|vda change this to use the disk you want
ignoredisk --only-use=$
autopart --type=btrfs
# Partition clearing information
clearpart --all --drives=$

# System timezone - Change This for your region
timezone America/Chicago

#Root password
rootpw --lock
# $ = username * = password hash
user --groups=wheel --name=$ --password=* --iscrypted --gecos="$"
