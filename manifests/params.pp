class saslauthd::params {

  $start                    = 'yes'
  $version                  = 'installed'
  $default_template         = 'saslauthd/default-saslauthd.erb'
  $mechanisms               = 'pam'
  $mech_options             = ''
  $threads                  = 5
  $options                  = '-c -m /var/run/saslauthd'

  # LDAP mechanism options
  $ldap_auth_method         = ''
  $ldap_bind_dn             = ''
  $ldap_bind_pw             = ''
  $ldap_default_realm       = ''
  $ldap_deref               = ''
  $ldap_filter              = ''
  $ldap_group_attr          = ''
  $ldap_group_dn            = ''
  $ldap_group_filter        = ''
  $ldap_group_match_method  = ''
  $ldap_group_search_base   = ''
  $ldap_group_scope         = ''
  $ldap_password            = ''
  $ldap_password_attr       = ''
  $ldap_referrals           = ''
  $ldap_restart             = ''
  $ldap_id                  = ''
  $ldap_authz_id            = ''
  $ldap_mech                = ''
  $ldap_realm               = ''
  $ldap_scope               = ''
  $ldap_search_base         = ''
  $ldap_servers             = ''
  $ldap_start_tls           = ''
  $ldap_time_limit          = ''
  $ldap_timeout             = ''
  $ldap_tls_check_peer      = ''
  $ldap_tls_cacert_file     = ''
  $ldap_tls_cacert_dir      = ''
  $ldap_tls_ciphers         = ''
  $ldap_tls_cert            = ''
  $ldap_tls_key             = ''
  $ldap_use_sasl            = ''
  $ldap_version             = ''

  case $::operatingsystem{
    'ubuntu','debian': {
      $package      = ['sasl2-bin', 'libsasl2-modules', 'cyrus-sasl2-doc']
      $service      = 'saslauthd'
      $config_file  = '/etc/saslauthd.conf'
      $default_file  = '/etc/default/saslauthd'
    }
    default:{
      fail("UnknownOS: $::operatingsystem")
    }
  }

}
