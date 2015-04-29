include powerdns

$pdns_dirs = [ "/etc/powerdns/", "/etc/powerdns/pdns.d/" ]

class { 'powerdns::mysql':
  ensure   => present,
  user     => 'powerdns',
  password => 'powerdnspassword',
  host     => '192.168.1.253',
  port     => '3306',
  dbname   => 'pdns',
  dnssec   => 'yes',
}

file { $pdns_dirs:
  ensure => "directory",
  owner  => "root",
  group  => "wheel",
  mode   => 750,
}
