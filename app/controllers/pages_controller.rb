class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :map]

  def home
    @experiences = Experience.all
  end

  def account
  end

  def map
    @experiences = Experience.geocoded

    @markers = @experiences.map do |experience|
      {
        lat: experience.latitude,
        lng: experience.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { experience: experience }),
        image_url: helpers.asset_url('icon-location.png')
      }
    end
  end
end
