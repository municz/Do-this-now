require 'google/api_client'

class HelloController < ApplicationController

  def index
    client = Google::APIClient.new
    plus = client.discovered_api('plus')
    response = client.execute(
      plus.activities.list,
      {'userId' => 'me', 'collection' => 'public'}
    )
  end

end
