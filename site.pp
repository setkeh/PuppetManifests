node 'arch-laptop.setkeh.local' {
  #puppet code
}
node '841734fa-cd43-4516-baa9-75e7a875d82e' {
  #puppet code
}

# Site Wide Config

package { 'openssh-server':
    ensure => installed,
}

service { 'sshd':
    enable  => true,
    ensure  => running,
    require => Package['openssh-server'],
}

user { 'setkeh':
    home       => '/home/setkeh',   # home directory is /home/admin
    managehome => true,            # manage the home directory by Puppet
    groups     => ['wheel'],       # the user belongs to wheel group
}

# Install and Configure sudo package
class { 'sudo':
  keep_os_defaults => false,
  defaults_hash    => {
    requiretty     => false,
    visiblepw      => false,
  },
  confs_hash       => {
    'setkeh'       => {
      ensure       => present,
      content      => 'setkeh ALL=(ALL) NOPASSWD: ALL',
    },
  },
}

include ssh_keys

ssh_keys::user{'setkeh':
  manage_ssh_dir => true,
}

ssh_keys::authorized_key{'workstation':
  key_line => 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAYEAxS05K7Hn8cFCyr3OlfZ7JkgO8nYOB/3i5+/nauG1U/NoLjstL2sQ/6ED6aTAKHXTrsM0RaSnReFgonbexYoZ9x4vYPBtOWc5PS1J0hQblRAMp6zJuYWRXN7ynTRAYRoLBPY2cKyAJU2HsS3y8tJaCcepe4Z+BHVjriXIVPngRlbUKtIOA+MTgHn8eYyQ72P8F9XbHgoQJEEOjNkldAuah9MuaPNHQpdqZkh5/fB1zM1V7MYacTybGDqKRTqNp+WQt9LKRevZ5tah2tv9lY6yaXgmny7Fi6qPbO5BAAaww0VgShpouJ6FgfZuA12pKoAK7rUf7AEAqcqb6T6LDT5jv+d5bCGGhPTHiEkaMPpCoXsfm9lCCatLv8OyorZq9duUVWtCukyU0VXOk/Dgf4Ns+zE4sk2am7wSlvOQVDtTlXCc4hIjiulKJjHbDynPnB7nu9wsQTGs8ts/1eNS56L0SqLvjz9q6PIipv32gftYMDgmgJpzDkaAq4ameF4S7oUt',
  user     => 'setkeh',
}

ssh_keys::authorized_key{'laptop':
  key_line => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfj2gOLaMjZ+qguetfd9xM0PduIgP8IXx2gB8fjfrlv9C2EMX6C3Ips1Sp2rcRDmF/GY0pjhgsAf0WLKdQP1qg7wgLmQ0Rv4PTYVdzFoTwCHI0xvzZqVGfRYombtF2HeLSNa2lXleCD3h71wrh6eunCtvOkKe7zsOt3jJsFQVtZ18+EUtnkv0XfDT60ZR+4HJ351gGsPGxVv3vjMxudRXyviQLWPGFdkmdCHJRZ4qcaWDZhPEEPWEmYBx64vp+zvHaN9QAbKXG72O8qEMtXatRYvVYsswv7J+NwwZiNntn74Flbb0jGnvphmmTljSJSRfsL6np8xPnaMAWM9ZHDHPv setkeh@SETKEH-LAPTOP',
  user     => 'setkeh',
}

class { '::ntp':
  servers => [ 'server 0.au.pool.ntp.org', 'server 1.au.pool.ntp.org' ],
}
