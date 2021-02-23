class UpdateController < ApplicationController

  require 'open-uri'
  require 'json'

  def index

    url = "https://raw.githubusercontent.com/Vericatch/devtestapiapp/master/mock_response.json"
    json_from_url = open(url).read
    updates_all = JSON.parse(json_from_url)
    
    updates_all.map {|update|
      update[:external_id] = update.delete :id
      Update.create(
        update
        )}
        
    byebug
  end

end
