# == Class: ros
#
# Full description of class ros here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'ros':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Tully Foote <tfoote@osrfoundation.org>
#
# === Copyright
#
# Copyright 2015 Open Source Robotics Foundation, Inc.
#
# @param ros_base_package 
# 
class ros (
  #String        $ros_base_package       = $ros::params::ros_base_package,
) {
  require ros::params
  require ros::install
  require ros::rosdep

  $setup_file = "/opt/ros/${ros::params::ros_version}/setup.bash"
}
