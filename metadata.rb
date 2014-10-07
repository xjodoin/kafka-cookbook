# encoding: utf-8

name             'kafka'
maintainer       'Mathias Söderberg'
maintainer_email 'mths@sdrbrg.se'
license          'Apache 2.0'
description      'Installs and configures a Kafka broker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

recipe 'kafka::default', 'Installs Kafka'

attribute "kafka/broker/zookeeper_connect",
:display_name => "Specifies the ZooKeeper connection string in the form hostname:port",
:required => "required"

attribute "kafka/broker/log_dirs",
:display_name => "A comma-separated list of one or more directories in which Kafka data is stored.",
:default => "/tmp/kafka-logs"
:required => "optional"


suggests 'java', '~> 1.22'

supports 'centos'
supports 'fedora'
supports 'amazon'
supports 'debian'
supports 'ubuntu'
