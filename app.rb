require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class RPS < Sinatra::Base
enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    @game = Game.create(params[:player_1], params[:player_2])
    p params
    redirect '/player1'
  end

  before do
    @game = Game.instance
  end

  get '/player1' do
    erb :player1
  end

  post '/weapon1' do
    @game.player_1.select_weapon(params[:weapon1])
    p params
    redirect '/player2'
  end

  get '/player2' do
    erb :player2
  end

  post '/weapon2' do
    if @game.player_2.is_a?(Computer)
      @game.computer
    else
      @game.player_2.select_weapon(params[:weapon2])
    end
    redirect '/result'
  end

  get '/result' do
    @game.result
    erb :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
