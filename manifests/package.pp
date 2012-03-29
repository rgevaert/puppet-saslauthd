class saslauthd::package {

  package {
    $saslauthd::package:
      ensure => $saslauthd::version,
  }

}
