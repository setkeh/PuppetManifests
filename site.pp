node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}
node 'dns.setkeh.local' {
  #puppet code
#import 'nodes/dns.pp'
include dns::server
# Forwarders
dns::server::options { '/etc/bind/named.conf.options':
  forwarders => [ '8.8.8.8', '8.8.4.4' ]
}
# Forward Zone
dns::zone { 'setkeh.local':
  soa         => 'ns1.setkeh.local',
  soa_email   => 'setkeh@gmail.com',
  nameservers => ['ns1']
}

# Reverse Zone
dns::zone { '1.168.192.IN-ADDR.ARPA':
  soa         => 'ns1.setkeh.local',
  soa_email   => 'setkeh@gmail.com',
  nameservers => ['ns1']
}

# A Records:
dns::record::a {
  'test':
    zone => 'setkeh.local',
    data => ['192.168.1.25'],
    ptr  => true; # Creates a matching reverse zone record.  Make sure you've added the proper reverse zone in the manifest.
}
}

# Site Wide Config
import 'site/*.pp'
