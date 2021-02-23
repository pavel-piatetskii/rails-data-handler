class UpdateController < ApplicationController

  require 'open-uri'
  require 'json'

  def index

    # Fetch data from the external API
    url = "https://raw.githubusercontent.com/Vericatch/devtestapiapp/master/mock_response.json"
    json_from_url = open(url).read

    # Parse data from the API, interprete keys as symbols instead of strings
    updates_all = JSON.parse(json_from_url, opt = {symbolize_names: true})
    
    # Get all external_ids from the DB and save those updates which were not
    # created there yet
    existing_external_ids = Update.pluck(:external_id)
    updates_all.map {|update|
      if !existing_external_ids.include?(update[:id])
        update[:external_id] = update.delete :id
        Update.create(update)
      end
    }
    
    @updates = Update.all
  end

end
