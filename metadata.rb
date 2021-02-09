name              'hashicorp-vault'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Application cookbook for installing and configuring Vault.'
issues_url        'https://github.com/sous-chefs/vault/issues'
source_url        'https://github.com/sous-chefs/vault'
chef_version      '>= 15'
version           '5.2.0'

supports 'amazon'
supports 'debian'
supports 'centos'
supports 'redhat'
supports 'opensuseleap'
supports 'suse'
supports 'ubuntu'

depends 'ark', '~> 5.0.0'
