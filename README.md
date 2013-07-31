puppet-phpldapadmin
===================

Puppet module for phpldapadmin

I use the Example42 nginx module for vhost, modified with php5-fpm support.


Sample Usage:
=============

Install and manage phpldapadmin via puppet with default data

    include phpldapadmin

Install and manage phpldapadmin via puppet with your ldap data

    class { 'phpldapadmin':
      nginx_user  => 'www-data',
      base_dn     => 'dc=example,dc=org',
      root_dn     => 'cn=admin,dc=example,dc=org',
    }
