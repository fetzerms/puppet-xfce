# @summary This class handles xfce installation
#
# @api private
class xfce::install {
  package { 'xfce4': ensure => 'present'}

  ##Add as optionals? 'xfce4-goodies', 'xfce4-terminal',
}
