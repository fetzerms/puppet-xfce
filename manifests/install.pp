# @summary This class handles xfce installation
#
# @api private
class xfce::install {
  $pkgs = [
    'xfce4',
    'xfce4-goodies',
    'xfce4-terminal',
  ]

  package { $pkgs: ensure => 'present'}
}
