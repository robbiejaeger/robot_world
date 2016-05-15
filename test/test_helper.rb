ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'

module TestHelpers
  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    database = Sequel.postgres('robot_manager_test')
    @robot_manager ||= RobotManager.new(database)
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
