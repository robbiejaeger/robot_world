require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest

  def test_user_sees_all_robots
    robot_id = robot_manager.create({
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

    visit '/robots'

    assert page.has_content?("#{robot_id}: Robot1")
  end

end
