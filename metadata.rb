# encoding: utf-8

name             'kafka'
maintainer       'Mathias Söderberg'
maintainer_email 'mths@sdrbrg.se'
license          'Apache 2.0'
description      'Installs and configures a Kafka broker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

recipe 'kafka::default', 'Installs Kafka'
recipe 'kafka::collectd', 'Configures monitoring by setting up collectd plugin for Kafka.'

attribute "kafka/broker/zookeeper_connect",
:display_name => "Specifies the ZooKeeper connection string in the form hostname:port",
:required => "required"

attribute "kafka/broker/log_dirs",
:display_name => "A comma-separated list of one or more directories in which Kafka data is stored.",
:default => "/tmp/kafka-logs",
:required => "optional"

attribute "kafka/broker/advertised_host_name",
:display_name => "If this is set this is the hostname that will be given out to producers, consumers, and other brokers to connect to.",
:required => "optional"

attribute "kafka/automatic_start",
:display_name => "Automatically start kafka service.",
:default => "false",
:required => "optional"

attribute "kafka/automatic_restart",
:display_name => "Automatically restart kafka on configuration change.",
:description => "This also implies `automatic_start` even if it's set to `false`. The reason for this is that I can see the need for automatically starting Kafka if it's not running, but not necessarily restart on configuration changes.",
:default => "false",
:required => "optional"


suggests 'java', '~> 1.22'

supports 'centos'
supports 'fedora'
supports 'amazon'
supports 'debian'
supports 'ubuntu'
