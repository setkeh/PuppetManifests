include powerdns

$pdns_dirs = [ "/etc/powerdns/", "/etc/powerdns/pdns.d/" ]

class { 'powerdns::postgresql':
  ensure   => present,
  user     => 'powerdns',
  password => 'secret',
  host     => 'localhost',
  port     => '5432',
  dbname   => 'pdns',
  dnssec   => 'yes',
}

file { $pdns_dirs:
  ensure => "directory",
  owner  => "root",
  group  => "wheel",
  mode   => 750,
}
