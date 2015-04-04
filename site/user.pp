user { 'setkeh':
    home       => '/home/setkeh',   # home directory is /home/admin
    managehome => true,            # manage the home directory by Puppet
    groups     => ['wheel'],       # the user belongs to wheel group
}
