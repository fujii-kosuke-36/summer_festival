class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :info
    require 'rspotify'
    ENV['ACCEPT_LANGUAGE'] = "ja"
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

    private
    def not_authenticated
        redirect_to login_path, info: 'ログインしてください'
    end
end


