class orjuuttaja {
	
	package {'puppet':
		ensure => installed,
	}
	
	file {'/etc/default/puppet':
		content => template ("orjuuttaja/puppet"),
		require => Package ['puppet'],
		notify => Service ['puppet'],
	}
	
	file { '/etc/puppet/puppet.conf':
		content => template ("orjuuttaja/puppet.conf"),
                require => Package ['puppet'],
                notify => Service ['puppet'],
	}
	
	service {'puppet':
		ensure => running,
		enable => true,
		require => Package ['puppet'],
	}
}
