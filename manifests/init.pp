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
  $package_name = $::snort::params::package_name,
  $service_name = $::snort::params::service_name,
) inherits ::snort::params {

  # validate parameters here

  class { '::snort::install': } ->
  class { '::snort::config': } ~>
  class { '::snort::service': } ->
  Class['::snort']
}
