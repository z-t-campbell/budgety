class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @experiences = Experience.all

raise

    # @experiences = Experience.geocoded #returns experiences with coordinates
    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { experience: experience }),
        image_url: helpers.asset_url('icon-location.png')
      }
    end

  end

  def account
  end
end
