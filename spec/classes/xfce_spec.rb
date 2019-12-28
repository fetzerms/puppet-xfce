require 'spec_helper'

describe 'xfce' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default parameters' do
        it { is_expected.to compile }
        it { is_expected.to contain_package('xfce4').only_with(ensure: 'present') }

        it {
          is_expected.to contain_exec('set_font').only_with(
            command: 'xfconf-query --channel xsettings --property /Gtk/FontName --set "Cantarell 10"',
            path: ['/usr/local/bin/', '/bin/'],
            user: 'vagrant',
          )
        }
      end

      context 'with display_manager service specified' do
        let(:params) { { 'display_manager' => 'dm_service' } }
        let(:pre_condition) { "service { 'dm_service': ensure => false, enable => false }" }

        it { is_expected.to compile }
        it { is_expected.to contain_package('xfce4').only_with(ensure: 'present') }

        it {
          is_expected.to contain_exec('set_font').with(
            command: 'xfconf-query --channel xsettings --property /Gtk/FontName --set "Cantarell 10"',
            path: ['/usr/local/bin/', '/bin/'],
            user: 'vagrant',
          ).that_comes_before(['Service[dm_service]'])
        }
      end
    end
  end
end
