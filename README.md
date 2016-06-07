# puppet-saslauthd
This is the saslauthd module.

##  Build status


[![Build Status](https://travis-ci.org/rgevaert/puppet-saslauthd.svg?branch=master)](https://travis-ci.org/rgevaert/puppet-saslauthd)

##  Usuage

You can manage saslauthd on Debian like systems.

```
class {
'saslauthd':
  version => latest;
}
```


If you set mechanisms to 'ldap' you can configure the saslauthd.conf parameters:

```
class {
'saslauthd':
   mechanisms         => 'ldap',
   ldap_auth_method   => 'custom',
   ldap_bind_dn       => 'cn=admin',
   ldap_bind_pw       => 'xyz',
   ldap_filter        => '(uid=%u)',
   ldap_search_base   => 'ou=people',
   ldap_servers       => 'ldap://localhost/',
   ldap_version       => '3',
}
```

To not start saslauthd use:

```
class {
'saslauthd':
  start  => 'no'
}
```

You can set many other parameters, have a look at the init.pp file.

## Development

See DEVELOPMENT.md.  When submitting a pull request please provide a rspec or beaker test.
