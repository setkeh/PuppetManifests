node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}

# Site Wide Config
import 'site/user.pp'
import 'site/sudo.pp'
import 'site/ssh.pp'
import 'site/ntp.pp'
