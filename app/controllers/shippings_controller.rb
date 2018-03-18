class ShippingsController < ApplicationController
  before_action :set_shipping, only: [:show, :update, :destroy]

  # GET /shippings
  def index
    @shippings = Shipping.all

    render json: @shippings
  end

  # GET /shippings/1
  def show
    render json: @shipping
  end

  # POST /shippings
  def create
    @shipping = Shipping.new(shipping_params)      

    existValue = Shipping.where(origin: @shipping.origin, destination: @shipping.destination)
  

  if existValue.length > 0

    @shipping.id = existValue[0].id
    updatevalue = Shipping.find(existValue[0].id)

    if updatevalue.update(distance:@shipping.distance, updated_at: Time.now)
      #render json: @shipping, status: :created, location: @shipping
      render :json => { json: @shipping, status: :created, location: existValue }, :status => 200
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end

  else
    if @shipping.save
      render json: @shipping, status: :created, location: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  end

  # PATCH/PUT /shippings/1
  def update
    if @shipping.update(shipping_params)
      render json: @shipping
    else
      render json: @shipping.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shippings/1
  def destroy
    @shipping.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping
      @shipping = Shipping.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipping_params
      params.permit(:origin, :destination, :distance)
    end
end
