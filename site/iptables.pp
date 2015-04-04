# Allow packets that belong to or related to an existing connection
iptables { 'allow established, related':
    state => ['ESTABLISHED', 'RELATED'],
    proto => 'all',
    jump  => 'ACCEPT',
}

# Allow all packets from localhost
iptables { 'allow localhost':
    source => '127.0.0.1',
    proto  => 'all',
    jump   => 'ACCEPT',
}

# Allow all packets from LAN
iptables { 'allow LAN':
    source => '192.168.1.0/24',
    proto  => 'all',
    jump   => 'ACCEPT',
}

# Allow all packets to SSH
iptables { 'allow ssh':
    proto => 'tcp',
    dport => 22,
    jump  => 'ACCEPT',
}

# Drop all incoming packets by default
iptables { 'drop incoming packets':
    chain => 'INPUT',
    proto => 'all',
    jump  => 'DROP',
}
