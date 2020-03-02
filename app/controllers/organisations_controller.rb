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
