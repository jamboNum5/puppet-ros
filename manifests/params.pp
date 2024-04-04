# == Class: ros::params
#
# A class to load parameters for the ros class
#
class ros::params {
  # TODO better parameterization
  # potential parameters:
  #  testing vs main
  #  python3
  notify { 'Distro' : name => $facts['os::distro::id'] }
  case $facts['os::distro::id'] {
    'Ubuntu': {
      #$repo_key         = '421C365BD9FF1F717815A3895523BAEEB01FA116'
      $repo_key_url     = 'https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc'
      $ros1_ros2        = 'ros'
      $repo_url         = "http://packages.ros.org/${ros1_ros2}/ubuntu"
      $repo_component   = 'main'

      # By default, install the latest available ROS release for
      # the platform.
      case $facts['os::release::full'] {
        10.04: {
          $ros_version     = 'fuerte'
        }
        12.04: {
          $ros_version     = 'hydro'
        }
        12.10: {
          $ros_version     = 'hydro'
        }
        13.04: {
          $ros_version     = 'hydro'
        }
        13.10: {
          $ros_version     = 'indigo'
        }
        14.04: {
          $ros_version     = 'indigo'
        }
        14.10: {
          $ros_version     = 'jade'
        }
        15.05: {
          $ros_version     = 'jade'
        }
        15.10: {
          $ros_version     = 'kinetic'
        }
        16.04: {
          $ros_version     = 'kinetic'
        }
        16.10: {
          $ros_version     = 'lunar'
        }
        17.04: {
          $ros_version     = 'lunar'
        }
        17.10: {
          $ros_version     = 'melodic'
        }
        18.04: {
          $ros_version     = 'melodic'
        }
        20.04: {
          if ($ros1_ros2 = 'ros') {
            $ros_version     = 'melodic'
          } else {
            $ros_version     = 'dashing'
          }
        }
        22.04: {
          if ($ros1_ros2 = 'ros') {
            $ros_version     = 'noetic'
          } else {
            $ros_version     = 'foxy'
          }
        }
        default: { # latest lts
          $ros_version     = 'noetic'
        }
      }
      $ros_base_package = "ros-${ros_version}-ros-base"
    }

    default: {
      #fail("Unsupported platform")
      #fail("Unsupported platform: ${facts['os::distro::id']}/${facts['os::name']}")
    }
  }
}
