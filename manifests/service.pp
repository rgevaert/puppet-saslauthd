class saslauthd::service {

  $ensure = $saslauthd::start ? {
    'no'    => stopped,
    default => running
  }

  service {
    'saslauthd':
      ensure      => $ensure,
      hasstatus   => false,
      hasrestart  => true,
  }

}
