# Change $$ to the release number of fedora you want to use
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$$&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$$&arch=x86_64" --cost=0
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$$&arch=x86_64"
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$$&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$$&arch=x86_64"
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$$&arch=x86_64" --cost=0

# Use graphical install
graphical --non-interactive

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_US.UTF-8

%packages
@^workstation-product-environment

%end
# Randomize hostname for deployment
echo "network --hostname=`echo $RANDOM.domain.test`" > /tmp/pre-hostname

# Run the Setup Agent on first boot
firstboot --disable

# $=nvme0n1|sda|vda change this to use the disk you want
ignoredisk --only-use=$
autopart --type=btrfs

# Partition clearing information
clearpart --all --drives=$

# System timezone - Change This for your region
timezone America/Chicago

#Setting for authconfiguration for hashing passwords
#RUN THIS COMMAND TO GET YOUR PASSWORD HASH ON ANOTHER COMPUTER
#'openssl passwd -1'
#THEN INPUT YOUR PASSWORD AND SAVE THE HASH OUTPUT
authconfig --enablemd5 --enableshadow

#Open SSH port for Ansible
firewall --enabled --ssh
systemctl enable sshd

#Root password to disabled
rootpw --lock

# $ = username * = password hash
user --groups=wheel --name=$ --password=* --iscrypted --gecos="$"
