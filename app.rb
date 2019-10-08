require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate_name = params[:pirate][:name]
      @pirate_height = params[:pirate][:height]
      @pirate_weight = params[:pirate][:weight]
      @pirate = Pirate.new(name: @pirate_name, weight: @pirate_weight, height: @pirate_height)

      ships = params[:pirate][:ships].each do |attributes|
        name = attributes[:name]
        type = attributes[:type]
        booty = attributes[:booty]
        Ship.new(name: name, type: type, booty: booty)
      end

      @ships = Ship.all

      erb :'pirates/show'
    end

  end
end
