node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}

node 'mysql.setkeh.local' {
  import 'nodes/mysql.pp'
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
