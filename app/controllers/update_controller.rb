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

    
    # Keywords to search for in the message field
    # The search query can easily expanded by adding new keywords
    keywords = ['coke', 'coca-cola', 'diet-cola']

    # Every keyword is transformed into a separate "LOWER... LIKE..." expression
    # Then all expressions are joined to form a very long "LIKE... OR LIKE..." string
    filter_query = keywords.map {|word|
      "LOWER(message) LIKE '%#{word.downcase}%'"  
    }.join(" OR ")

    @updates = Update.where(filter_query).order(sentiment: :desc)
    @total_updates_count = Update.all.count
    @filter_matches_count = @updates.length
    @percentage = (100 * @filter_matches_count / @total_updates_count).to_i

    # Change the 'contain' word form is there's only one match
    @contains_grammar = @filter_matches_count == 1 ? 'contains' : 'contain'

  end

end
