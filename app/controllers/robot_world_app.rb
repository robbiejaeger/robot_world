class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    @robots = robot_manager.all
    @dashboard.get_data(@robots)
    @results = @dashboard.data
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_manager.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_manager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_manager.destroy(id.to_i)
    redirect '/robots'
  end

  def robot_manager
    if ENV["RACK_ENV"] == "test"
      database = YAML::Store.new('db/robot_manager_test')
    else
      database = YAML::Store.new('db/robot_manager')
    end
    @dashboard ||= Dashboard.new
    @robot_manager ||= RobotManager.new(database)
  end
end
