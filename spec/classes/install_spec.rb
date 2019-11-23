require 'spec_helper'

describe 'xfce::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it { is_expected.to contain_package('xfce4').with(ensure: 'present') }
      it { is_expected.to contain_package('xfce4-goodies').with(ensure: 'present') }
      it { is_expected.to contain_package('xfce4-terminal').with(ensure: 'present') }
    end
  end
end
