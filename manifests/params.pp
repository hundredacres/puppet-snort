# == Class snort::params
#
# This class is meant to be called from snort.
# It sets variables according to platform.
#
class snort::params {
  $ip_ranges ='any'
  $dns_servers = '$HOME_NET'
  $snort_perfprofile = false
  $stream_memcap = '8388608'
  $stream_prune_log_max = '1048576'
  $stream_max_queued_segs = '2621'
  $stream_max_queued_bytes = '1048576'
  $perfmonitor_pktcnt = '10000'
  $dcerpc2_memcap = '102400'
  $enable = true
  $ensure = running
  $barnyard = false
  $norules = false
  $rotation = '7'

  case $::osfamily {
    'Debian': {
      $package_name = 'snort'
      $service_name = 'snort'
    }
    'RedHat', 'Amazon': {
      $package_name = 'snort'
      $service_name = 'snortd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
