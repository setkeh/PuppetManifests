class { 'bind':
  confdir    => '/etc/named',
  cachedir   => '/var/lib/named',
  forwarders => [
    '8.8.8.8',
    '8.8.4.4',
  ],
  dnssec     => true,
  version    => 'Controlled by Puppet',
}

bind::zone { 'setkeh.local':
  zone_type       => 'master',
  domain          => 'setkeh.local',
 #allow_updates   => [ 'key local-update', ],
 #allow_transfers => [ 'secondary-dns', ],
  ns_notify       => true,
  dnssec          => false,
}

resource_record { 'test.setkeh.local':
  ensure  => present,
  record  => 'test.setkeh.local',
  type    => 'A',
  data    => [ '192.168.1.12' ],
  ttl     => 86400,
  zone    => 'setkeh.local',
  server  => 'ns.setkeh.local',
  #keyname => 'local',
  #hmac    => 'hmac-sha1',
  #secret  => 'aLE5LA=='
}
