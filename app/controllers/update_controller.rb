class UpdateController < ApplicationController

  require 'open-uri'
  require 'json'

  def index

    url = "https://raw.githubusercontent.com/Vericatch/devtestapiapp/master/mock_response.json"
    json_from_url = open(url).read
    updates_all = JSON.parse(json_from_url)
    #byebug

  end

end
