class Admin::LibrariesController < AdminController
	before_action :set_library, only: %i[show edit update destroy]

    # GET /admin/libraries or /admin/libraries.json
    def index
      @q = Library.ransack(params[:q])
      @libraries = @q.result.page(params[:page]).order(created_at: :asc)
    end

    # GET /admin/libraries/1 or /admin/libraries/1.json
    def show; end

    # GET /admin/libraries/new
    def new
      @library = Library.new
      #@library.archives.build
    end

    # GET /admin/libraries/1/edit
    def edit; end

    # POST /admin/libraries or /admin/libraries.json
    def create
      @library = Library.new(library_params)
      respond_to do |format|
        if @library.save
          format.html { redirect_to admin_library_url(@library), notice: "Library was successfully created." }
          format.json { render :show, status: :created, location: @library }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @library.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/libraries/1 or /admin/libraries/1.json
    def update
      respond_to do |format|
        if @library.update(library_params)
          format.html { redirect_to admin_library_url(@library), notice: "Library was successfully updated." }
          format.json { render :show, status: :ok, location: @library }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @library.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/libraries/1 or /admin/libraries/1.json
    def destroy
      @library.destroy

      respond_to do |format|
        format.html { redirect_to admin_libraries_url, notice: "Library was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit!
    end
  end
