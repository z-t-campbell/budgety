class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user
    @organisation.save
    redirect_to organisation_path(@organisation)
  end

  def show
    @organisation = Organisation.find(params[:id])
    @counter = 0
    @rating = 0
      @organisation.experiences.each do |experience|
        experience.reviews.each do |review|
          @counter += 1
          @rating += review.rating
        end
      end
    @organisation.rating = @rating / @counter
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    @organisation.update(organisation_params)
    redirect_to organisation_path(@organisation)
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    if @organisation
      @organisation.destroy
    else
      render :show
    end
    redirect_to root_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :location)
  end
end
