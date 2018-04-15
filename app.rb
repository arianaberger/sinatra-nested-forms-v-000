require './environment'

module FormsLab
  class App < Sinatra::Base

  get '/' do
    erb :root
  end

  get '/new' do
    erb :'pirates/new'
  end

  post '/pirates' do
    #add instance variables here
    @pirate = Pirate.new(params[:pirate])

    params[:pirate][:ships].each do |details| 
      Ship.new(details)
    end

    @ships = Ship.all
    binding.pry
    erb :'pirates/show'
  end

  end
end
