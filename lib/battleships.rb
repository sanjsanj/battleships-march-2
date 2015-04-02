require 'sinatra/base'
require_relative 'board'
require_relative 'cell'
require_relative 'game'
require_relative 'player'
require_relative 'ship'
require_relative 'water'

class BattleShips < Sinatra::Base
  enable :sessions

  set :views, Proc.new { File.join(root, "..", "views") }

  GAME = Game.new

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
    player_1 = Player.new(session['player_1_name'])
    player_2 = Player.new(session['player_2_name'])
    player_1_board = Board.new({ size: 100, cell: Cell })
    player_2_board = Board.new({ size: 100, cell: Cell })
    player_1.board = player_1_board
    player_2.board = player_2_board
    GAME.add_player player_1
    GAME.add_player player_2
    player_1_board.fill_all_content Water.new
    player_2_board.fill_all_content Water.new

    @player_1_grid = player_1_board.grid.values.map {|cell| cell.content.class }.each_slice(10).to_a

    erb :start_game
  end

  post '/start_game' do
    GAME.player_2.board.place Ship.new, params[:ship_coord].to_sym
    erb :start_game

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
