node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}

node 'mysql.setkeh.local' {
  import 'nodes/mysql.pp'
  include mysql
  mysql::grant { 'DNS':
    mysql_user     => 'dnsuser',
    mysql_password => 'dnspassword',
    mysql_host     => '192.168.1.254/255.255.255.0',
  }
}

node 'dns.setkeh.local' {
  #puppet code
import 'nodes/yum.pp'
include powerdns
powerdns::config { 'cache-ttl':
  ensure => present,
  value  => 20,
}
import 'nodes/dns.pp'
}

# Site Wide Config
import 'site/*.pp'
