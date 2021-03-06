hashicorp_vault_install 'package' do
  install_method :ark
  version '1.6.1'
  action :install
end

directory '/opt/vault/tls' do
  owner 'vault'
  group 'vault'
  mode '0750'
  recursive true

  action :create
end

openssl_x509_certificate '/opt/vault/tls/tls.crt' do
  common_name 'Vault Testing'
  expire 7
  subject_alt_name ['IP:127.0.0.1', 'DNS:localhost.localdomain']
end

hashicorp_vault_config_global 'vault' do
  sensitive false
  telemetry(
    statsite_address: '127.0.0.1:8125',
    disable_hostname: true
  )

  action :create
end

hashicorp_vault_config_listener 'tcp' do
  type 'tcp'
  description 'Test TCP listener'
  options(
    'address' => '127.0.0.1:8200',
    'cluster_address' => '127.0.0.1:8201',
    'tls_cert_file' => '/opt/vault/tls/tls.crt',
    'tls_key_file' => '/opt/vault/tls/tls.key',
    'telemetry' => {
      'unauthenticated_metrics_access' => false,
    }
  )
end

hashicorp_vault_config_storage 'Test file storage' do
  type 'file'
  description 'Test file storage'
  options(
    'path' => '/opt/vault/data'
  )
end

hashicorp_vault_service 'vault' do
  vault_binary_path '/usr/local/bin/vault'
  action %i(create enable start)
  subscribes :restart, 'template[/etc/vault.d/vault.hcl]', :delayed
end
