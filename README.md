# Fedora Workstation Playbooks
Playbooks for configuring my workstations how I like them.

Feel free to take these and do with what you will.

To use these files: You must have ansible installed.

Put your ip address of your target machine and substitue $ with your user name in the hosts file.

Execute with <ansible-playbook masterplaybook.yml -i hosts -kK>.
Enter the user's password, press enter.
Enter the user's become password (sudo password) if different than login password, press enter.
Wait for everything to complete.

If you get an error about ssh keys, etc, try ssh'ing into the machine first with a regular <ssh user@IP> and exit. This will add the ssh key for that machine to your known_hosts file in your home directory.

Included is a kickstart file with my base configuration for unattended installations with a network-install image. Feel free to take and do with what you will.