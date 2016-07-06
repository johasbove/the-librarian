class PublishersController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.order("created_at").last(10)
    respond_with(@publishers)
  end

  def show
    respond_with(@publisher)
  end

  def new
    @publisher = Publisher.new
    respond_with(@publisher)
  end

  def edit
  end

  def create
    @publisher = Publisher.new(publisher_params)
    @publisher.save
    respond_with(@publisher)
  end

  def update
    @publisher.update(publisher_params)
    respond_with(@publisher)
  end

  def destroy
    @publisher.destroy
    respond_with(@publisher)
  end

  private
  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :origin_country, :founded_year, :founder)
  end
end