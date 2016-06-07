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
          :mechanisms => 'ldap',
          :ldap_auth_method => "blabla",
          :ldap_bind_dn => "blabla",
          :ldap_bind_pw => "blabla",
          :ldap_default_realm => "blabla",
          :ldap_deref => "blabla",
          :ldap_filter => "blabla",
          :ldap_group_attr => "blabla",
          :ldap_group_dn => "blabla",
          :ldap_group_pw => "blabla",
          :ldap_group_filter => "blabla",
          :ldap_group_match_method => "blabla",
          :ldap_group_search_base => "blabla",
          :ldap_group_scope => "blabla",
          :ldap_password => "blabla",
          :ldap_password_attr => "blabla",
          :ldap_referrals => "blabla",
          :ldap_restart => "blabla",
          :ldap_id => "blabla",
          :ldap_authz_id => "blabla",
          :ldap_mech => "blabla",
          :ldap_realm => "blabla",
          :ldap_scope => "blabla",
          :ldap_search_base => "blabla",
          :ldap_servers => "blabla",
          :ldap_start_tls => "blabla",
          :ldap_time_limit => "blabla",
          :ldap_timeout => "blabla",
          :ldap_tls_check_peer => "blabla",
          :ldap_tls_cacert_file => "blabla",
          :ldap_tls_cacert_dir => "blabla",
          :ldap_tls_ciphers => "blabla",
          :ldap_tls_cert => "blabla",
          :ldap_tls_key => "blabla",
          :ldap_use_sasl => "blabla",
          :ldap_version => "blabla",
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
            'ensure'  => 'present',
            'group'   => 'root',
            'mode'    => '0600',
            'owner'   => 'root'
          )
      end

      ldap_content = [ 'ldap_auth_method: blabla',
            'ldap_bind_dn: blabla',
            'ldap_bind_pw: blabla',
            'ldap_default_realm: blabla',
            'ldap_deref: blabla',
            'ldap_filter: blabla',
            'ldap_group_attr: blabla',
            'ldap_group_dn: blabla',
            'ldap_group_filter: blabla',
            'ldap_group_match_method: blabla',
            'ldap_group_search_base: blabla',
            'ldap_group_scope: blabla',
            'ldap_password: blabla',
            'ldap_password_attr: blabla',
            'ldap_referrals: blabla',
            'ldap_restart: blabla',
            'ldap_id: blabla',
            'ldap_authz_id: blabla',
            'ldap_mech: blabla',
            'ldap_realm: blabla',
            'ldap_scope: blabla',
            'ldap_search_base: blabla',
            'ldap_servers: blabla',
            'ldap_start_tls: blabla',
            'ldap_time_limit: blabla',
            'ldap_timeout: blabla',
            'ldap_tls_check_peer: blabla',
            'ldap_tls_cacert_file: blabla',
            'ldap_tls_cacert_dir: blabla',
            'ldap_tls_ciphers: blabla',
            'ldap_tls_cert: blabla',
            'ldap_tls_key: blabla',
            'ldap_use_sasl: blabla',
            'ldap_version: blabla',]
      ldap_content.each do |d|
        it do
          is_expected.to contain_file('saslauthd.conf').with_content(/#{d}/)
        end
      end

      default_file= nil
      case facts[:operatingsystem]
      when 'Ubuntu','Debian'
      then
          default_file = '/etc/default/saslauthd'
          default_content = ['MECHANISMS="ldap"',
                              'START=yes',
                              'MECH_OPTIONS=""',
                              'THREADS=5',
                              'OPTIONS="-O /etc/saslauthd.conf -m /var/run/saslauthd -c"', ]
      when 'RedHat','Centos'
      then
          default_file = '/etc/sysconfig/saslauthd'
          default_content = ['MECH="ldap"',
                              'SOCKETDIR="/var/run/saslauthd"',
                              'FLAGS="-O /etc/saslauthd.conf -c"']
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


      end
    end
  end
end
