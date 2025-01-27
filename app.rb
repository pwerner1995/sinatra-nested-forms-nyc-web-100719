require './environment'
require_relative './app/models/pirate.rb'
require_relative './app/models/ship.rb'
require 'pry'
module FormsLab
  class App < Sinatra::Base

    get "/" do 

      erb :root
    end

    get "/new" do

      erb :"pirates/new"
    end

    post "/pirates" do
      @pirate = Pirate.new(name: params[:pirate][:name],height: params[:pirate][:height],weight: params[:pirate][:weight])
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.all
      erb :"pirates/show" 
    end

  end
end
