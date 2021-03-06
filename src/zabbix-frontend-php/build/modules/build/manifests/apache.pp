class build::apache {
  require build::apache::packages
  require build::apache::supervisor

  bash_exec { 'a2enmod actions': }
  bash_exec { 'a2enmod vhost_alias': }
  bash_exec { 'a2enmod rewrite': }
  bash_exec { 'a2enmod ssl': }
  bash_exec { 'a2enmod headers': }

  file { '/var/www/index.html':
    ensure => absent
  }

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent
  }
}
