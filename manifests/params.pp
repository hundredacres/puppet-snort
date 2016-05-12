# == Class snort::params
#
# This class is meant to be called from snort.
# It sets variables according to platform.
#
class snort::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'snort'
      $service_name = 'snort'
    }
    'RedHat', 'Amazon': {
      $package_name = 'snort'
      $service_name = 'snort'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
