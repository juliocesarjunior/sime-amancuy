class Api::V1::LibrariesController <  ApiController

	before_action :set_library, only: [:show]

	def index
		@per_page = params[:per_page] || 25
		@page = params[:page] || 1

		@q = Library.active.order(name: :asc).ransack(params[:q])
		@libraries = @q.result
		@libraries = @libraries.page(@page).per(@per_page)

		render json: @libraries, meta: pagination_dict(@libraries), each_serializer: LibrarySerializer
	end

	def show
		@library = Library.active.find(params[:id])

		if @library
			render json: @library, status: :ok
		else
			render json: { error: 'library not found' }, status: :not_found
		end
	end


	private

	def set_library
		@library = Library.find(params[:id]) || {}
	end

	def library_params
		params.require(:library).permit!
	end
end
