class ApplicationController < ActionController::Base
    require 'rspotify'
    ENV['ACCEPT_LANGUAGE'] = "ja"
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
end


