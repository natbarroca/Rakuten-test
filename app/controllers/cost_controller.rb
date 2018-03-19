class CostController < ApplicationController

	 # GET /shippings
  def index

  	require 'dijkstraclass'

    r = Shipping.pluck(:origin,:destination, :distance)

    start_point = cost_params["origin"] # starting node
	end_point = cost_params["destination"] # arrival node

	puts 'chamando método'

	obj = DijkstraClass.new(start_point, end_point, r)

	@cost = obj.cost

	costcalc = @cost.to_i * cost_params["weight"].to_i * 0.15


	render :json => { cost: costcalc}, :status => 200
  end

  # Only allow a trusted parameter "white list" through.
    def cost_params
      params.permit(:origin, :destination, :weight)
    end
end
