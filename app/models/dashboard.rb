class Dashboard

  attr_reader :data

  def initialize
    @data = {
      :avg_age => 0,
      :robots_per_year => [],
      :robots_by_department => [],
      :robots_per_state => [],
      :robots_per_city => []
      }
  end

  def get_data(robots)
    @data[:avg_age] = average_robot_age(robots)
    @data[:robots_per_year] = robots_per_year(robots)
    @data[:robots_by_department] = robots_by_department(robots)
    @data[:robots_per_state] = robots_per_state(robots)
    @data[:robots_per_city] = robots_per_city(robots)
  end

  def average_robot_age(robots)
    (robots.map do |robot|
      (Date.today - robot.birthdate)/(365.25)
    end.reduce(:+)/robots.count).round(2)
  end

  def robots_per_year(robots)
    year_hash = robots.inject(Hash.new(0)){ |h, robot| h[robot.birthdate.year] += 1 ; h}
    year_hash.sort_by {|year, num| year}
  end

  def robots_by_department(robots)
    department_hash = robots.inject(Hash.new(0)){ |h, robot| h[robot.department] += 1 ; h}
  end

  def robots_per_state(robots)
    state_hash = robots.inject(Hash.new(0)){ |h, robot| h[robot.state] += 1 ; h}
    state_hash.sort_by {|state, num| state}
  end

  def robots_per_city(robots)
    city_hash = robots.inject(Hash.new(0)){ |h, robot| h[robot.city] += 1 ; h}
    city_hash.sort_by {|city, num| city}
  end
end
