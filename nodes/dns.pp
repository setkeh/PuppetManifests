include powerdns
class { 'powerdns::postgresql':
  ensure   => present,
  user     => 'powerdns',
  password => 'secret',
  host     => 'localhost',
  port     => '5432',
  dbname   => 'pdns',
  dnssec   => 'yes',
}
