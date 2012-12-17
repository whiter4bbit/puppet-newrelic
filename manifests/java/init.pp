class newrelic::java($agent_source, $config_content) {
  class { "newrelic::java::package":
    agent_source => $agent_source
  }

  file { "/usr/share/newrelic/newrelic.yml":
    content => $config_content,
    ensure => exists,
    require => Class["newrelic::java::package"]
  }
}
