# optional, this should be the path to where the hiera data config file is in this repo
# You must update this if your actual hiera data lives inside your module.
# I only assume you have a separate repository for hieradata and its include in your .fixtures
hiera_config_file = File.expand_path(File.join(File.dirname(__FILE__), 'fixtures','modules','hieradata', 'hiera.yaml'))

# hiera_config and hiera_data are mutually exclusive contexts.

shared_context :global_hiera_data do
  let(:hiera_data) do
     {
       #"saslauthd::config_file" => '',
       #"saslauthd::default_file" => '',
       #"saslauthd::default_template" => '',
       #"saslauthd::ldap_auth_method" => '',
       #"saslauthd::ldap_authz_id" => '',
       #"saslauthd::ldap_bind_dn" => '',
       #"saslauthd::ldap_bind_pw" => '',
       #"saslauthd::ldap_default_realm" => '',
       #"saslauthd::ldap_deref" => '',
       #"saslauthd::ldap_filter" => '',
       #"saslauthd::ldap_group_attr" => '',
       #"saslauthd::ldap_group_dn" => '',
       #"saslauthd::ldap_group_filter" => '',
       #"saslauthd::ldap_group_match_method" => '',
       #"saslauthd::ldap_group_pw" => '',
       #"saslauthd::ldap_group_scope" => '',
       #"saslauthd::ldap_group_search_base" => '',
       #"saslauthd::ldap_id" => '',
       #"saslauthd::ldap_mech" => '',
       #"saslauthd::ldap_password" => '',
       #"saslauthd::ldap_password_attr" => '',
       #"saslauthd::ldap_realm" => '',
       #"saslauthd::ldap_referrals" => '',
       #"saslauthd::ldap_restart" => '',
       #"saslauthd::ldap_scope" => '',
       #"saslauthd::ldap_search_base" => '',
       #"saslauthd::ldap_servers" => '',
       #"saslauthd::ldap_start_tls" => '',
       #"saslauthd::ldap_time_limit" => '',
       #"saslauthd::ldap_timeout" => '',
       #"saslauthd::ldap_tls_cacert_dir" => '',
       #"saslauthd::ldap_tls_cacert_file" => '',
       #"saslauthd::ldap_tls_cert" => '',
       #"saslauthd::ldap_tls_check_peer" => '',
       #"saslauthd::ldap_tls_ciphers" => '',
       #"saslauthd::ldap_tls_key" => '',
       #"saslauthd::ldap_use_sasl" => '',
       #"saslauthd::ldap_version" => '',
       #"saslauthd::mech_options" => '',
       #"saslauthd::mechanisms" => '',
       #"saslauthd::options" => '',
       #"saslauthd::package" => '',
       #"saslauthd::service" => '',
       #"saslauthd::socket_dir" => '',
       #"saslauthd::start" => '',
       #"saslauthd::threads" => '',
       #"saslauthd::version" => '',
     
     }
  end
end

shared_context :hiera do
    # example only,
    let(:hiera_data) do
        {:some_key => "some_value" }
    end
end

shared_context :linux_hiera do
    # example only,
    let(:hiera_data) do
        {:some_key => "some_value" }
    end
end

# In case you want a more specific set of mocked hiera data for windows
shared_context :windows_hiera do
    # example only,
    let(:hiera_data) do
        {:some_key => "some_value" }
    end
end

# you cannot use this in addition to any of the hiera_data contexts above
shared_context :real_hiera_data do
    let(:hiera_config) do
       hiera_config_file
    end
end
