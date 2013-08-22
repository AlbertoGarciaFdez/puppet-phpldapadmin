class phpldapadmin (
  $nginx_user = params_lookup( 'nginx_user' ),
  $base_dn    = params_lookup( 'base_dn' ),
  $root_dn    = params_lookup( 'root_dn' ),
  $ip_server  = params_lookup( 'ip_server' )

) inherits phpldapadmin::params {

  file { 'responses':
    path    => '/tmp/responses',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template("phpldapadmin/selections.erb")
  }

  package { 'php5-common':
    ensure  => '5.4.4-14+deb7u3',
    require => File['responses'],
  }
  
  package { 'php5-fpm':
    ensure  => '5.4.4-14+deb7u3',
    require => Package['php5-common'],
  }

 package { 'php5-cli':
    ensure  => '5.4.4-14+deb7u3',
    require => Package['php5-fpm'],
  }

  package { 'php5-ldap':
    ensure  => '5.4.4-14+deb7u3',
    require => Package['php5-cli'],
  }
 
  package { 'phpldapadmin':
    ensure        => installed,
    responsefile  => '/tmp/responses',
    require       => Package['php5-ldap'],
  }

  file { 'autofsMap.xml':
    path    => '/etc/phpldapadmin/templates/creation/autofsMap.xml',
    owner   => $nginx_user,
    group   => $nginx_user,
    mode    => '0640',
    source  => 'puppet:///modules/phpldapadmin/autofsMap.xml',
    require => Package['phpldapadmin'],
  }
}
