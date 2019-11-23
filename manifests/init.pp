# @summary This class manages xfce
#
# @example
#   include xfce
class xfce {
  contain xfce::install
  contain xfce::config
  contain xfce::service

  Class['xfce::install']
  -> Class['xfce::config']
  ~> Class['xfce::service']
}
