# @summary This class handles xfce configuration
#
# @api private
class xfce::config {
  if ($xfce::display_manager != '') and (defined(Service[$xfce::display_manager])) {
    exec { 'set_font':
      command => 'xfconf-query --channel xsettings --property /Gtk/FontName --set "Cantarell 10"',
      path    => [ '/usr/local/bin/', '/bin/', '/usr/bin/' ],
      user    => 'vagrant',
      before  => Service[$xfce::display_manager],
    }
  }
  else {
    exec { 'set_font':
      command => 'xfconf-query --channel xsettings --property /Gtk/FontName --set "Cantarell 10"',
      path    => [ '/usr/local/bin/', '/bin/', '/usr/bin/' ],
      user    => 'vagrant',
    }
  }
}
