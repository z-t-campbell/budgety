class ExperiencesController < ApplicationController
def index
  @experiences = Experience.all
end

def show
  @experience = Experience.find(params[:id])
end

def new
  @experience = Experience.new
end

def create
  @experience = Experience.new(experience_params)
  @experience.save

  redirect_to experience_path(@experience)
  #need to add organisation id and user id
end

def edit
  @experience = Experience.find(params[:id])
end

def update
  @experience = Experience.find(params[:id])
  @experience.update(experience_params)

  redirect_to experience_path(@experience)
end

def destroy
  @experience = Experience.find(params[:id])
  @experience.destroy
end

private

def experience_params
  params.require(:experience).permit(:name, :category, :description, :location, :date, :start_time, :end_time, :venue_name)
end
end



