# @summary This class manages xfce
#
# This is very simple and at the moment only sets up the base xfce4
#
# @example Basic usage
#   include xfce
#
# @example Ensure the display manager service `lightdm` is setup _after_ xfce
#   class { 'xfce ': 
#     display_manager => 'lightdm',
#   }
#
# @param display_manager
#   If set, and a service exists in the catalog by the same name, then XFCE will be installed _before_ that service. This may avoid having
#   to restart the display manager after installing XFCE.
class xfce (
  String $display_manager = ''
){
  contain xfce::install
  contain xfce::config
  contain xfce::service

  Class['xfce::install']
  -> Class['xfce::config']
  ~> Class['xfce::service']
}
