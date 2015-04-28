node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}
node 'dns.setkeh.local' {
  #puppet code
#import 'nodes/dns.pp'
include pdns
pdns::nameserver {
    backend           =>     'sqlite',
    listen_address    =>     '192.168.1.254',
    forward_domain    =>     'local',
  }
  pdns::resolver {
    listen_address    =>      '127.0.0.1',
    forward_domain    =>      'local',
    nameservers       =>      '8.8.8.8,8.8.4.4',
  }
}

# Site Wide Config
import 'site/*.pp'
