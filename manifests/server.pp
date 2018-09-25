# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::server
class profiles::server(String $site_content) {
  package { 'nginx':
    ensure => present,
  }

  file { '/var/www/html/index.html':
    content => $site_content,
    ensure  => file,
  }

  service { 'nginx':
    ensure  => 'running',
    enable  => 'true',
    require => Package['nginx'],
  }
}
