require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'priates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:ship].each do |ship, details|
        Ship.new(details)
      end

      @ships = Ship.all

      erb :'pirates/show'
    end
  end
end
end