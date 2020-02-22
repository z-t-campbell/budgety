class OrganisationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]
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

  private

  def organisation_params
    params.require(:organisation).permit(:name, :location)
  end
end
