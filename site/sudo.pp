# Install and Configure sudo package
class { 'sudo':
  keep_os_defaults => false,
  defaults_hash    => {
    requiretty     => false,
    visiblepw      => false,
  },
  confs_hash       => {
    '%wheel'       => {
      ensure       => present,
      content      => '%wheel ALL=(ALL) NOPASSWD: ALL',
    },
  },
}
