class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
    end

    def create
        artwork = Artowrk.new(artwork_params)
        if artwork.save
            render jason: artwork
        else
            render artwork.errors_full_message, 
    end
end