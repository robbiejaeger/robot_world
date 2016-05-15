class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    robot[:avatar] = "https://robohash.org/#{robot[:name]}.png"
    table.insert(robot)
  end

  def table
    database.from(:robots).order(:id)
  end

  def all
    table.to_a.map{|robot_data| Robot.new(robot_data)}
  end

  def locate_robot(id)
    table.where(:id => id)
  end

  def raw_robot(id)
    locate_robot(id).to_a.first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    robot[:avatar] = "https://robohash.org/#{robot[:name]}.png"
    locate_robot(id).update(robot)
  end

  def destroy(id)
    locate_robot(id).delete
  end

  def delete_all
    table.delete
  end
end
