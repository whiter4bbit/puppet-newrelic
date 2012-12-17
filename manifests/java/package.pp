class newrelic::java::package($agent_source) {
  Exec { path => ["/usr/bin"] }

  file { "/tmp/newrelic_agent.zip":
    source => $agent_path,
    ensure => exists
  }

  exec { "unzip /tmp/newrelic_agent.zip":
    cwd => "/usr/share",
    require => File["/tmp/newrelic_agent.zip"]
  }
}
