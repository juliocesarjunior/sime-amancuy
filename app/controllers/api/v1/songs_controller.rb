class Api::V1::SongsController <  ApiController

	before_action :set_song, only: [:show]

	def index
		@per_page = params[:per_page] || 22
		@page = params[:page] || 1

		@q = Song.active.order(created_at: :asc).ransack(params[:q])
		@songs = @q.result
		@songs = @songs.page(@page).per(@per_page)

		render json: @songs, meta: pagination_dict(@songs), each_serializer: SongSerializer
	end

	def show
		@song = Song.active.find(params[:id])

		if @song
			render json: @song, status: :ok
		else
			render json: { error: 'song not found' }, status: :not_found
		end
	end


	private

	def set_song
		@song = Song.find(params[:id]) || {}
	end

	def song_params
		params.require(:song).permit!
	end
end
