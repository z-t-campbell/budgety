class ExperiencesController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :create, :show ,:index]

def index
  @experiences = Experience.all
  @experiences = @experiences.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
  @location = params[:location]
  @experiences = @experiences.where("category ILIKE ?", "%#{params[:category]}%") if params[:category].present?
  @category = params[:category]
  @experiences = @experiences.where("price_cents <= ?", params[:budget].to_f*100) if params["budget"].present?
  @category = params[:budget]
  # if params[:location].present? && params[:category].present?
  #   @experiences = Experience.where("location ILIKE ?", "%#{params[:location]}%")
  #   @location = params[:location]
  # elsif
  #   @experiences = Experience.all
  # end
  # if params[:query].present?
  #   @experiences = Experience.where("location ILIKE ?", "%#{params[:query]}%")
  # else
  #   @experiences = Experience.all
  # end


end

def show
  @experience = Experience.find(params[:id])
  @organisation = @experience.organisation
end

def new
  @organisation = Organisation.find(params[:organisation_id])
  @experience = Experience.new
  @categories = ["Arts, Theatre & Shows", "Comedy", "Food & Drink", "Beauty & Spa", "Health & Fitness", "Music Events", "Culture", "Learning", "Family", "Romantic", "Couples", "Groups", "Gift Ideas"]
end

def create
  @organisation = Organisation.find(params[:organisation_id])
  @experience = Experience.new(experience_params)
  @experience.organisation = @organisation
  @experience.save

  redirect_to experience_path(@experience)
end

def edit
  @experience = Experience.find(params[:id])
  @organisation = Organisation.find(params[:organisation_id])
end

def update
  @experience = Experience.find(params[:id])
  @experience.update(experience_params)
  redirect_to experience_path(@experience)
end

def destroy
  @experience = Experience.find(params[:id])
  @organisation = @experience.organisation
  @experience.destroy
  redirect_to organisation_path(@organisation)
end

private

def experience_params
  params.require(:experience).permit(:name, :category, :description, :location, :date, :start_time, :end_time, :price, :photos)
end
end
