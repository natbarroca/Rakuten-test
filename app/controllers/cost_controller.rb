class CostController < ApplicationController

	 # GET /shippings
  def index

  	require 'dijkstraclass'

    #r = Shipping.pluck(:origin,:destination, :distance)

    r = [
	 ["A", "B", 1],
     ["A", "F", 9],
     ["D", "J", 3],
     ["G", "C", 3],
     ["A", "C", 7],
     ["F", "B", 2],
     ["B", "C", 1],
     ["C", "F", 4],
     ["E", "Z", 2]]

     r2 = [[1, 3, 9],
     [1, 5, 3],
     [2, 4, 3],
     [2, 3, 7],
     [4, 3, 2],
     [4, 1, 1],
     [5, 2, 4],
     [5, 4, 2]]

     #ojbteste = Test.new("1", "3")


    start_point = cost_params["origin"] # starting node
	end_point = cost_params["destination"] # arrival node

	puts 'chamando método'

	obj = DijkstraClass.new(start_point, end_point, r)

	#ob = Dijkstra.new("A", "B", r3)

	@cost = obj.cost

	costcalc = @cost.to_i * cost_params["weight"].to_i * 0.15


	render :json => { cost: costcalc}, :status => 200
  end

  # Only allow a trusted parameter "white list" through.
    def cost_params
      params.permit(:origin, :destination, :weight)
    end
end
