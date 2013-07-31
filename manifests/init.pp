class phpldapadmin (
  $nginx_user = params_lookup( 'nginx_user' ),
  $base_dn    = params_lookup( 'base_dn' ),
  $root_dn    = params_lookup( 'root_dn' ),

) inherits phpldapadmin::params {

  package { 'phpldapadmin':
    ensure => installed,
  }

  file { 'config.php':
    path    => '/etc/phpldapadmin/config.php',
    owner   => $nginx_user,
    group   => $nginx_user,
    mode    => '0640',
    content => template("phpldapadmin/config.php.erb"),
    require => Package['phpldapadmin'],
    notify  => Service['nginx'],
  }

  file { 'autofsMap.xml':
    path    => '/etc/phpldapadmin/templates/creation/autofsMap.xml',
    owner   => $nginx_user,
    group   => $nginx_user,
    mode    => '0640',
    source  => 'puppet:///modules/phpldapadmin/autofsMap.xml',
    require => Package['phpldapadmin'],
  }

  service { 'nginx':
    ensure => running
  }
}
