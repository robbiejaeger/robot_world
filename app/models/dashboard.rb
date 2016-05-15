class Dashboard

  attr_reader :data

  def initialize
    @data = {:avg_age => 0}
  end

  def get_data(robots)
    @data[:avg_age] = average_robot_age(robots)
    # Breakdown of how many robots were hired each year

    # Number of robots in each department

    # Number of robots in each state

    # Number of robots in each city
  end

  def average_robot_age(robots)
    (robots.map do |robot|
      (Date.today - robot.birthdate)/(365.25)
    end.reduce(:+)/robots.count).round(2)
  end
end
