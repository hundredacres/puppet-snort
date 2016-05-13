# Class: snort
# ===========================
#
# Full description of class snort here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class snort (
  $package_name            = $::snort::params::package_name,
  $service_name            = $::snort::params::service_name,
  $ip_ranges               = $::snort::params::ip_ranges,
  $dns_servers             = $::snort::params::dns_servers,
  $snort_perfprofile       = $::snort::params::snort_perfprofile,
  $stream_memcap           = $::snort::params::stream_memcap,
  $stream_prune_log_max    = $::snort::params::stream_prune_log_max,
  $stream_max_queued_segs  = $::snort::params::stream_max_queued_segs,
  $stream_max_queued_bytes = $::snort::params::stream_max_queued_bytes,
  $perfmonitor_pktcnt      = $::snort::params::perfmonitor_pktcnt,
  $dcerpc2_memcap          = $::snort::params::dcerpc2_memcap,
  $enable                  = $::snort::params::enable,
  $ensure                  = $::snort::params::ensure,
  $barnyard                = $::snort::params::false,
  $norules                 = $::snort::params::norules,
  $rotation                = $::snort::params::rotation,
) inherits ::snort::params {

  # validate parameters here
  validate_string($package_name,$service_name)
  validate_bool($barnyard)

  if $barnyard {
    ::snort::plugin {'barnyard2':}
  }

  class { '::snort::install': } ->
  class { '::snort::config': } ~>
  class { '::snort::service': } ->
  Class['::snort']
}
