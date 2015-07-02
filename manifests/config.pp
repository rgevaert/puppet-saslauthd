class saslauthd::config {

  $ensure = $saslauthd::mechanisms ? {
    'ldap'  =>  present,
    default => absent
  }

  $config_file_option = $saslauthd::mechanisms ? {
    'ldap'  => "-O $saslauthd::config_file ",
    default => ""
  }

  file {
    'saslauthd.conf':
      ensure  => $ensure,
      name    => $saslauthd::config_file,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      content => template('saslauthd/saslauthd.conf.erb'),
  }

  file {
    'default-saslauthd':
      ensure  => present,
      name    => $saslauthd::default_file,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template($saslauthd::default_template),
  }

}
