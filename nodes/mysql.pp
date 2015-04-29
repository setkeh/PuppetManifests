class { "mysql":
  root_password => 'PossiblyAPassword',
  bind-address  => '192.168.1.153',
}

mysql::grant { 'DNS':
  mysql_user     => 'dnsuser',
  mysql_password => 'dnspassword',
  mysql_host     => '192.168.1.254/255.255.255.0',
}
