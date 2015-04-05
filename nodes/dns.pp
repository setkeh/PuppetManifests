class { '::bind':
bind::zone {'setkeh.local':
  zone_contact => 'setkeh@gmail.com',
  zone_ns      => ['ns0.setkeh.local'],
  zone_serial  => '2012112901',
  zone_ttl     => '604800',
  zone_origin  => 'setkeh.local',
}

bind::a { 'Hosts in example.com':
  ensure    => 'present',
  zone      => 'example.com',
  ptr       => false,
  hash_data => {
    'test' => { owner => '192.168.1.12', }, 
  },
}
}
