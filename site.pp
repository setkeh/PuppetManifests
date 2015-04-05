node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}
node 'dns.setkeh.local' {
  #puppet code

  include dns::server

  # Forwarders
  dns::server::options { '/etc/named/named.conf.options':
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
    'dns':
      zone => 'setkeh.local',
      data => ['192.168.1.254'],
      ptr  => true;
    'test':
      zone => 'setkeh.local',
      data => ['192.168.1.12'],
      ptr  => true;
  }
}

# Site Wide Config
import 'site/*.pp'
