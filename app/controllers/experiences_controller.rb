class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show, :index]
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.geocoded #returns experiences with coordinates
    @experiences = @experiences.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
    @location = params[:location]

    @category = params[:category]
    @experiences = @experiences.where("price_cents <= ?", params[:budget].to_f*100) if params[:budget].present?
    @budget = params[:budget]
    @experiences = @experiences.where("category ILIKE ?", "%#{params[:name]}%") if params[:name].present?
    @budget = params[:name]
    @experiences = @experiences.where("category ILIKE ?", "%#{params[:date]}%") if params[:date].present?
    @budget = params[:date]
    @experiences = @experiences.where("category ILIKE ?", "%#{params[:rating]}%") if params[:rating].present?

    @categories = ["Arts, Theatre & Shows", "Comedy", "Food & Drink", "Beauty & Spa", "Music Events","Thrill Seeking", "Classes"]


    if params[:categoriesparam].present?
      @search = []
      params[:categoriesparam].each do |category|
        @search << @experiences.where("category ILIKE ?", "%#{category}%")
      end
      @experiences = @search.flatten

    end
  end


  def show
    @organisation = @experience.organisation
    # raise
    @markers = [{
        lat: @experience.latitude,
        lng: @experience.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { experience: @experience }),
        image_url: helpers.asset_url('icon-location.png')
      }]

  end

  def new
    @organisation = Organisation.find(params[:organisation_id])
    @experience = Experience.new
    @categories = ["Arts, Theatre & Shows", "Comedy", "Food & Drink", "Beauty & Spa", "Music Events","Thrill Seeking", "Classes"]
  end

  def create
    @organisation = Organisation.find(params[:organisation_id])
    @experience = Experience.new(experience_params)
    @experience.organisation = @organisation
    @experience.save

    redirect_to experience_path(@experience)
  end

  def edit
    @organisation = Organisation.find(params[:organisation_id])
  end

  def update
    @experience.update(experience_params)
    redirect_to experience_path(@experience)
  end

  def destroy
    @organisation = @experience.organisation
    @experience.destroy
    redirect_to organisation_path(@organisation)
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:name, :category, :description, :location, :date, :start_time, :end_time, :price, :photos)
  end
end
