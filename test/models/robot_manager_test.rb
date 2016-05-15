require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_id = robot_manager.create({
      name: "Rob",
      city: "Denver",
      state: "CO",
      avatar: "https://robohash.org/Rob.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Programming"
      })

    robot = robot_manager.find(robot_id)

    assert_equal robot_id, robot.id
    assert_equal "Rob", robot.name
    assert_equal "CO", robot.state
  end

  def test_can_get_all_robots
    robot_manager.create({
      name: "Robot1",
      city: "City1",
      state: "CO",
      avatar: "https://robohash.org/Robot1.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department1"
      })

    robot_manager.create({
      name: "Robot2",
      city: "City2",
      state: "CO",
      avatar: "https://robohash.org/Robot2.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department2"
      })

    robots = robot_manager.all

    assert_equal 2, robots.count
    assert robots[0].kind_of?(Robot)
    assert_equal "Robot2", robots[1].name
  end

  def test_can_find_a_robot
    robot_id = robot_manager.create({
      name: "Robot1",
      city: "City1",
      state: "CO",
      avatar: "https://robohash.org/Robot1.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department1"
      })

    robot = robot_manager.find(robot_id)

    assert_equal "Robot1", robot.name
  end

  def test_can_update_a_robot
    robot_id = robot_manager.create({
      name: "Robot1",
      city: "City1",
      state: "CO",
      avatar: "https://robohash.org/Robot1.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department1"
      })

    robot_manager.update(robot_id, {
      name: "Robot1 UPDATED",
      city: "City1",
      state: "CO",
      avatar: "https://robohash.org/Robot1.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department1"
      })

    robot = robot_manager.find(robot_id)

    assert_equal "Robot1 UPDATED", robot.name
  end

  def test_can_delete_a_robot
    robot1_id = robot_manager.create({
      name: "Robot1",
      city: "City1",
      state: "CO",
      avatar: "https://robohash.org/Robot1.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department1"
      })

    robot2_id = robot_manager.create({
      name: "Robot2",
      city: "City2",
      state: "CO",
      avatar: "https://robohash.org/Robot2.png",
      birthdate: "1988-06-05",
      date_hired: "2010-10-10",
      department: "Department2"
      })

    robot_manager.destroy(robot1_id)

    robots = robot_manager.all

    assert_equal robot2_id, robots[0].id
  end

end
