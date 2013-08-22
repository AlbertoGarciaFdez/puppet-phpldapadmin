puppet-phpldapadmin
===================

Puppet module for phpldapadmin


Sample Usage:
=============

Install and manage phpldapadmin via puppet

    include phpldapadmin


    class { 'phpldapadmin':
      nginx_user  => 'www-data',
      base_dn     => 'dc=lrentalia,dc=com',
      root_dn     => 'cn=admin,dc=lrentalia.com',
    }
