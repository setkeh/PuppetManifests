# PuppetManifests
My Puppet manifests for configuring nodes.


Things TODO:
-------------
Need to add Hiera to take usernames and ssh_keys out of the config.

If you add my SSH keys to your server dont forget to pm me their IP's :P


Things and Stuff:
-----------------
All site wide config should go in sites/ directory sites.pp will automatically include all manifests in this DIR

Power DNS required some directory patches if you need to edit this you can edit the variable $pdns_dirs in nodes/dns.pp


Tools and Modules:
------------------
https://forge.puppetlabs.com/justinclayton/sudo

https://forge.puppetlabs.com/nightfly/ssh_keys

https://forge.puppetlabs.com/attachmentgenie/ssh

https://forge.puppetlabs.com/puppetlabs/aws

https://forge.puppetlabs.com/antonlindstrom/powerdns

https://forge.puppetlabs.com/puppetlabs/ntp

https://forge.puppetlabs.com/jfryman/nginx

https://forge.puppetlabs.com/example42/yum

https://forge.puppetlabs.com/puppetlabs/mysql
