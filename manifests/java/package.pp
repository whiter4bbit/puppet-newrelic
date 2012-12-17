class newrelic::java::package($agent_source) {
  Exec { path => ["/usr/bin"] }

  file { "/tmp/newrelic_agent.zip":
    source => $agent_source,
    ensure => present
  }

  exec { "unzip /tmp/newrelic_agent.zip":
    cwd => "/usr/share",
    creates => "/usr/share/newrelic",
    require => File["/tmp/newrelic_agent.zip"]
  }
}
