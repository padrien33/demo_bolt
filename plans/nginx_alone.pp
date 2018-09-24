plan profiles::nginx_alone(
  TargetSpec $nodes,
  String $site_content = 'hello!',
) {
  # Install puppet on the target and gather facts
  $nodes.apply_prep

  # Compile the manifest block into a catalog 
  apply($nodes) {
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
}
