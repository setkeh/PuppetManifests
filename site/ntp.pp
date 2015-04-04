class { '::ntp':
  servers => [ 'server 0.au.pool.ntp.org', 'server 1.au.pool.ntp.org' ],
}
