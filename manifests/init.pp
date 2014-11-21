# Define: msttcorefonts
# 
# This modules installs msttcorefonts to the system
#
# Fonts 
#   http://askubuntu.com/questions/16225/how-can-i-accept-microsoft-eula-agreement-for-ttf-mscorefonts-installer
#   http://cgit.drupalcode.org/sandbox-jrockowitz-1782266/tree/provision/puppet/manifests/classes/common.pp?id=d212a2fcb73fce05431d223f8fe14f9828ce7710
#
# Example use:
#   msttcorefonts { }
#
class msttcorefonts {
	exec { 'accept-msttcorefonts-license':
		command => '/bin/sh -c "echo ttf-mscorefonts-installer msttcorefonts/accepted- mscorefonts-eula select true | debconf-set-selections"'
	}
	package { 'msttcorefonts':
		ensure => installed,
		require => Exec['accept-msttcorefonts-license']
	}
}

