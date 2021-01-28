require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/team' do
        @team_name = params[:team][:name]
        @team_motto = params[:team][:motto]
        @heroes = []
        params[:team][:members].each do |h|
            @heroes << {
                name: h[:name],
                power: h[:power],
                bio: h[:bio]
            }
        end

        erb :team
    end


end
