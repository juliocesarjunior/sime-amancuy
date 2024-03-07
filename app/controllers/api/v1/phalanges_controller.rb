class Api::V1::PhalangesController < ApiController

	before_action :set_phalange, only: [:show]

	def index
		@per_page = params[:per_page] || 22
		@page = params[:page] || 1

		@q = Phalange.active.order(order: :asc).ransack(params[:q])
		@phalanges = @q.result
		@phalanges = @phalanges.page(@page).per(@per_page)

		render json: @phalanges, meta: pagination_dict(@phalanges), each_serializer: PhalangeSerializer
	end

	def show
		@phalange = Phalange.active.find(params[:id])

		if @phalange
			render json: @phalange, status: :ok
		else
			render json: { error: 'phalange not found' }, status: :not_found
		end
	end


	private

	def set_phalange
		@phalange = Phalange.find(params[:id]) || {}
	end

	def phalange_params
		params.require(:phalange).permit!
	end
end
