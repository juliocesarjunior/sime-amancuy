class Admin::SongsController < AdminController
	before_action :set_song, only: %i[show edit update destroy]

    # GET /admin/songs or /admin/songs.json
    def index
    	@q = Song.ransack(params[:q])
    	@songs = @q.result.page(params[:page]).order(name: :asc)
    end

    # GET /admin/songs/1 or /admin/songs/1.json
    def show; end

    # GET /admin/songs/new
    def new
    	@song = Song.new
      #@song.archives.build
  end

    # GET /admin/songs/1/edit
    def edit; end

    # POST /admin/songs or /admin/songs.json
    def create
    	@song = Song.new(song_params)
    	respond_to do |format|
    		if @song.save
    			format.html { redirect_to admin_song_url(@song), notice: "song was successfully created." }
    			format.json { render :show, status: :created, location: @song }
    		else
    			format.html { render :new, status: :unprocessable_entity }
    			format.json { render json: @song.errors, status: :unprocessable_entity }
    		end
    	end
    end

    # PATCH/PUT /admin/songs/1 or /admin/songs/1.json
    def update
    	respond_to do |format|
    		if @song.update(song_params)
    			format.html { redirect_to admin_song_url(@song), notice: "song was successfully updated." }
    			format.json { render :show, status: :ok, location: @song }
    		else
    			format.html { render :edit, status: :unprocessable_entity }
    			format.json { render json: @song.errors, status: :unprocessable_entity }
    		end
    	end
    end

    # DELETE /admin/songs/1 or /admin/songs/1.json
    def destroy
    	@song.destroy

    	respond_to do |format|
    		format.html { redirect_to admin_songs_url, notice: "song was successfully destroyed." }
    		format.json { head :no_content }
    	end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_song
    	@song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
    	params.require(:song).permit!
    end
end
