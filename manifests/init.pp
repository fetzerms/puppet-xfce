# @summary This class manages xfce
#
# This is very simple and at the moment only sets up the base xfce4
#
# @example Basic usage
#   include xfce
class xfce {
  contain xfce::install
  contain xfce::config
  contain xfce::service

  Class['xfce::install']
  -> Class['xfce::config']
  ~> Class['xfce::service']
}
