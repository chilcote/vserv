USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
PACKAGE_VERSION=1.0.0
TITLE=vserv
REVERSE_DOMAIN=com.github.vserv
PAYLOAD= \
		pack-Library-LaunchAgents-com.github.vserv.monitor.plist \
		pack-usr-local-bin-vserv.py