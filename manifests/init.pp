# Class: saslauthd
#
# This module manages saslauthd.
#
# Sample Usage:
# class {
#  'saslauthd':
#    version => latest;
# }
class saslauthd (
  $start                    = $saslauthd::params::start,
  $version                  = $saslauthd::params::version,
  $mechanisms               = $saslauthd::params::mechanisms,
  $mech_options             = $saslauthd::params::mech_options,
  $threads                  = $saslauthd::params::threads,
  $options                  = $saslauthd::params::options,
  $default_template         = $saslauthd::params::default_template,
  $socket_dir               = $saslauthd::params::socket_dir,
  $package                  = $saslauthd::params::package,
  $service                  = $saslauthd::params::service,
  $config_file              = $saslauthd::params::config_file,
  $default_file             = $saslauthd::params::default_file,

  $ldap_auth_method         = $saslauthd::params::ldap_auth_method,
  $ldap_bind_dn             = $saslauthd::params::ldap_bind_dn,
  $ldap_bind_pw             = $saslauthd::params::ldap_bind_pw,
  $ldap_default_realm       = $saslauthd::params::ldap_default_realm,
  $ldap_deref               = $saslauthd::params::ldap_deref,
  $ldap_filter              = $saslauthd::params::ldap_filter,
  $ldap_group_attr          = $saslauthd::params::ldap_group_attr,
  $ldap_group_dn            = $saslauthd::params::ldap_group_dn,
  $ldap_group_pw            = $saslauthd::params::ldap_group_pw,
  $ldap_group_filter        = $saslauthd::params::ldap_group_filter,
  $ldap_group_match_method  = $saslauthd::params::ldap_group_match_method,
  $ldap_group_search_base   = $saslauthd::params::ldap_group_search_base,
  $ldap_group_scope         = $saslauthd::params::ldap_group_scope,
  $ldap_password            = $saslauthd::params::ldap_password,
  $ldap_password_attr       = $saslauthd::params::ldap_password_attr,
  $ldap_password_attr       = $saslauthd::params::ldap_password_attr,
  $ldap_referrals           = $saslauthd::params::ldap_referrals,
  $ldap_restart             = $saslauthd::params::ldap_restart,
  $ldap_id                  = $saslauthd::params::ldap_id,
  $ldap_authz_id            = $saslauthd::params::ldap_authz_id,
  $ldap_mech                = $saslauthd::params::ldap_mech,
  $ldap_realm               = $saslauthd::params::ldap_realm,
  $ldap_scope               = $saslauthd::params::ldap_scope,
  $ldap_search_base         = $saslauthd::params::ldap_search_base,
  $ldap_search_base         = $saslauthd::params::ldap_search_base,
  $ldap_servers             = $saslauthd::params::ldap_servers,
  $ldap_start_tls           = $saslauthd::params::ldap_start_tls,
  $ldap_time_limit          = $saslauthd::params::ldap_time_limit,
  $ldap_timeout             = $saslauthd::params::ldap_timeout,
  $ldap_tls_check_peer      = $saslauthd::params::ldap_tls_check_peer,
  $ldap_tls_cacert_file     = $saslauthd::params::ldap_tls_cacert_file,
  $ldap_tls_cacert_dir      = $saslauthd::params::ldap_tls_cacert_dir,
  $ldap_tls_ciphers         = $saslauthd::params::ldap_tls_ciphers,
  $ldap_tls_cert            = $saslauthd::params::ldap_tls_cert,
  $ldap_tls_key             = $saslauthd::params::ldap_tls_key,
  $ldap_use_sasl            = $saslauthd::params::ldap_use_sasl,
  $ldap_version             = $saslauthd::params::ldap_version

  ) inherits saslauthd::params {

  class{'saslauthd::package':} ~>
  class{'saslauthd::config':} ~>
  class{'saslauthd::service':}

}
