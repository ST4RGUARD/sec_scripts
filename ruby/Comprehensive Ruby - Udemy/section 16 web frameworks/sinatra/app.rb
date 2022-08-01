require 'sinatra'

class HiSinatra < Sinatra::Base
  get '/' do
    'Hey Sinatra!'
  end

  get '/:age' do
    "hi i'm #{params[:age]} years old"
  end
end
