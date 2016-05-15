require 'bundler'
Bundler.require

databases = [Sequel.postgres("robot_manager"), Sequel.postgres("robot_manager_test")]

databases.each do |database|
  database.create_table :robots do
    primary_key :id
    String      :name, :size => 255
    String      :city, :size => 255
    String      :state, :size => 255
    String      :avatar, :size => 255
    Date        :birthdate
    Date        :date_hired
    String      :department, :size => 255
  end
end
