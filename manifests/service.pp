# == Class snort::service
#
# This class is meant to be called from snort.
# It ensure the service is running.
#
class snort::service {

  service { $::snort::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
