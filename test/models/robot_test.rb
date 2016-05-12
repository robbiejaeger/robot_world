require_relative '../test_helper'

class RobotTest < Minitest::Test
  include TestHelpers

  def test_it_creates_at_robot
    robot_manager.create({
      name: "Rob",
      city: "Denver",
      state: "CO",
      avatar: "https://robohash.org/Rob.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Programming"
      })

    robot = robot_manager.find(1)

    assert_equal 1, robot.id
  end

end
