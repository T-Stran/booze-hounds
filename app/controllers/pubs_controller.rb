class PubsController < ApplicationController

  def index
    @pubs = Pub.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @pubs.geocoded.map do |pub|
      {
        lat: pub.latitude,
        lng: pub.longitude
      }
    end
  end
end
