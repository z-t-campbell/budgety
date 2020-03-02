class ExperiencesController < ApplicationController
def index
  @experiences = Experience.all
end

def show
  @experience = Experience.find(params[:id])
  @organisation = @experience.organisation
end

def new
  @organisation = Organisation.find(params[:organisation_id])
  @experience = Experience.new
  @categories = ["Art & Theatre", "Food & Drink", "Beauty & Spa", "Health & Fitness", "Music", "Culture", "Learning", "Family", "Romantic", "Couple", "Groups"]
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
  params.require(:experience).permit(:name, :category, :description, :location, :date, :start_time, :end_time, :photos)
end
end
