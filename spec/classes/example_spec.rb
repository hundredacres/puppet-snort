require 'spec_helper'

describe 'snort' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "snort class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('snort::params') }
          it { is_expected.to contain_class('snort::install').that_comes_before('snort::config') }
          it { is_expected.to contain_class('snort::config') }
          it { is_expected.to contain_class('snort::service').that_subscribes_to('snort::config') }

          it { is_expected.to contain_service('snort') }
          it { is_expected.to contain_package('snort').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'snort class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('snort') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
