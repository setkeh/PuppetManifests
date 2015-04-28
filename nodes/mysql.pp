include mysql

class { 'mysql::server':
  create_root_user        => 'true',
  root_password           => 'strongpassword',
  remove_default_accounts => true,
  override_options        => $override_options,
}

mysql::db { 'DNS':
  user     => 'dnsuser',
  password => 'dnspass',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}