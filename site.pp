node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}
node 'dns.setkeh.local' {
  #puppet code
  include 'nodes/dns.pp'
}

# Site Wide Config
import 'site/*.pp'
