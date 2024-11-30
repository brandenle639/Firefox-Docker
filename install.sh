apt-get update
apt-get install -y aptitude ca-certificates wget gpg sudo xserver-xorg xserver-xorg-core xfonts-base xinit x11-xserver-utils alsa-utils pulseaudio curl net-tools
apt-get install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo "deb [trusted=true] https://deb.debian.org/debian unstable main" >> /etc/apt/sources.list
apt-get update
apt-get install -y firefox cups-client
useradd -s /bin/bash -d /home/fire -m fire
mkdir -p /home/fire
chown fire:fire /home/fire
