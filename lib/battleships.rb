require 'sinatra/base'

class BattleShips < Sinatra::Base
  enable :sessions

  set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    'Hello BattleShips!'
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    @name = params[:Name]

    if @name.empty?
      redirect :new_game
    else
      session['player_1_name'] = @name
      session['player_2_name'] = 'CPU'
      redirect :start_game
    end
  end

  get '/start_game' do
    @name = session['player_1_name']
    erb :start_game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
