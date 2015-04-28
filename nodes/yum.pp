include yum
class { 'yum':
  extrarepo => [ 'epel' , 'puppetlabs' ],
}
