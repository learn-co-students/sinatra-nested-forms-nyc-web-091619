require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base
    # code other routes/actions here

    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      # binding.pry
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      # @ship_1 = Ship.new(params[:pirate][:ships][][:name], params[:pirate][:ships][][:type], params[:pirate][:ships][][:booty])
      # @ship_2 = Ship.new(params[:pirate][:ships][][:name], params[:pirate][:ships][][:type], params[:pirate][:ships][][:booty])
      params[:pirate][:ships].each do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end
      erb :"pirates/show"
    end

  end
end
