# encoding: utf-8

name             'kafka'
maintainer       'Mathias Söderberg'
maintainer_email 'mths@sdrbrg.se'
license          'Apache 2.0'
description      'Installs and configures a Kafka broker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

depends 'collectd', '~> 1.1.0'

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

attribute "kafka/broker/auto_leader_rebalance_enable",
          :display_name => "Balance leadership for partitions.",
          :description => "If this is enabled the controller will automatically try to balance leadership for partitions among the brokers by periodically returning leadership to the 'preferred' replica for each partition if it is available.",
          :default => "false",
          :required => "optional"

attribute "kafka/broker/controlled_shutdown_enable",
          :display_name => "Enable controlled shutdown of the broker.",
          :description => "If enabled, the broker will move all leaders on it to some other brokers before shutting itself down. This reduces the unavailability window during shutdown.",
          :default => "false",
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

attribute "kafka/heap_opts",
          :display_name => "JVM heap options for Kafka.",
          :required => "optional"

attribute "kafka/jvm_performance_opts",
          :display_name => "JVM Performance options for Kafka.",
          :required => "optional"


suggests 'java', '~> 1.22'

supports 'centos'
supports 'fedora'
supports 'amazon'
supports 'debian'
supports 'ubuntu'
