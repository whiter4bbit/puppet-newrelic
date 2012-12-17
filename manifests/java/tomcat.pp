class newrelic::java::tomcat {
  Class['newrelic::java::tomcat'] -> Class['newrelic::java']

  Exec { path => ["/bin/"] }

  exec { 'sed -i s/"JAVA_OPTS=\"\(.*\)\""/"JAVA_OPTS=\"\1 -javaagent:\/usr\/share\/newrelic.jar\""/g /etc/tomcat7/tomcat7.conf':
    require => Package['tomcat7.noarch']
  }
}
