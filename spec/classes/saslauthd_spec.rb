require 'spec_helper'
require 'shared_contexts'

describe 'saslauthd' do
  # by default the hiera integration uses hiera data from the shared_contexts.rb file
  # but basically to mock hiera you first need to add a key/value pair
  # to the specific context in the spec/shared_contexts.rb file
  # Note: you can only use a single hiera context per describe/context block
  # rspec-puppet does not allow you to swap out hiera data on a per test block
  #include_context :hiera

  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
      end

      # below is a list of the resource parameters that you can override.
      # By default all non-required parameters are commented out,
      # while all required parameters will require you to add a value
      let(:params) do
        {
          #:start => yes,
          #:version => installed,
          #:mechanisms => pam,
          #:mech_options => ,
          #:threads => 5,
          #:options => -c,
          #:default_template => $saslauthd::params::default_template,
          #:socket_dir => /var/run/saslauthd,
          #:package => $saslauthd::params::package,
          #:service => $saslauthd::params::service,
          #:config_file => $saslauthd::params::config_file,
          #:default_file => $saslauthd::params::default_file,
          #:ldap_auth_method => ,
          #:ldap_bind_dn => ,
          #:ldap_bind_pw => ,
          #:ldap_default_realm => ,
          #:ldap_deref => ,
          #:ldap_filter => ,
          #:ldap_group_attr => ,
          #:ldap_group_dn => ,
          #:ldap_group_pw => $saslauthd::params::ldap_group_pw,
          #:ldap_group_filter => ,
          #:ldap_group_match_method => ,
          #:ldap_group_search_base => ,
          #:ldap_group_scope => ,
          #:ldap_password => ,
          #:ldap_password_attr => ,
          #:ldap_referrals => ,
          #:ldap_restart => ,
          #:ldap_id => ,
          #:ldap_authz_id => ,
          #:ldap_mech => ,
          #:ldap_realm => ,
          #:ldap_scope => ,
          #:ldap_search_base => ,
          #:ldap_servers => ,
          #:ldap_start_tls => ,
          #:ldap_time_limit => ,
          #:ldap_timeout => ,
          #:ldap_tls_check_peer => ,
          #:ldap_tls_cacert_file => ,
          #:ldap_tls_cacert_dir => ,
          #:ldap_tls_ciphers => ,
          #:ldap_tls_cert => ,
          #:ldap_tls_key => ,
          #:ldap_use_sasl => ,
          #:ldap_version => ,
        }
      end
      # add these two lines in a single test block to enable puppet and hiera debug mode
      # Puppet::Util::Log.level = :debug
      # Puppet::Util::Log.newdestination(:console)
      it do
        is_expected.to compile.with_all_deps
      end

      it do
        is_expected.to contain_file('saslauthd.conf')
          .with(
            'ensure'  => 'absent',
            'group'   => 'root',
            'mode'    => '0600',
            'owner'   => 'root'
          )
      end

      default_file= nil
      default_content = nil
      case facts[:operatingsystem]
      when 'Ubuntu','Debian'
      then
          default_file = '/etc/default/saslauthd'
          default_content = ['MECHANISMS="pam"',
                              'START=yes',
                              'MECH_OPTIONS=""',
                              'THREADS=5',
                              'OPTIONS="-m /var/run/saslauthd -c"', ]
      when 'RedHat','Centos'
      then
          default_file = '/etc/sysconfig/saslauthd'
          default_content = ['MECH="pam"',
                              'SOCKETDIR="/var/run/saslauthd"',
                              'FLAGS="-c"']
      end

      it do
        is_expected.to contain_file('default-saslauthd')
          .with(
            'ensure'  => 'present',
            'group'   => 'root',
            'mode'    => '0644',
            'owner'   => 'root',
            'path'    => default_file,
          )
      end

      default_content.each do |d|
        it do
          is_expected.to contain_file('default-saslauthd').with_content(/#{d}/)
        end
      end


      packages = []
      case facts[:operatingsystem]
      when 'Ubuntu','Debian' then packages = ['sasl2-bin', 'libsasl2-modules', 'cyrus-sasl2-doc']
      when 'RedHat','Centos' then packages = [ 'cyrus-sasl', 'cyrus-sasl-ldap', 'cyrus-sasl-lib' ]
      end

      packages.each do |p|
        it do
          is_expected.to contain_package(p).with( 'ensure' => 'installed')
        end
      end

      it do
        is_expected.to contain_service('saslauthd')
          .with(
            'ensure'     => 'running',
            'hasrestart' => 'true',
            'hasstatus'  => 'false'
          )
      end

      end
    end
  end
end
