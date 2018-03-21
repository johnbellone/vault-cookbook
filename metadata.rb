name 'hashicorp-vault'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache-2.0'
description 'Application cookbook for installing and configuring Vault.'
long_description 'Application cookbook for installing and configuring Vault.'
issues_url 'https://github.com/johnbellone/vault-cookbook/issues'
source_url 'https://github.com/johnbellone/vault-cookbook/'
version '2.5.2'
chef_version '>= 12.5' if respond_to?(:chef_version)

supports 'ubuntu', '>= 12.04'
supports 'redhat', '>= 6.4'
supports 'centos', '>= 6.4'
supports 'windows'
supports 'freebsd'

depends 'build-essential'
depends 'golang', '~> 1.7'
depends 'poise', '~> 2.6'
depends 'poise-service', '~> 1.1'
depends 'rubyzip', '~> 1.0'
