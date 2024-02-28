class Admin::PhalangesController < AdminController
	before_action :set_phalange, only: %i[show edit update destroy]

    # GET /admin/phalanges or /admin/phalanges.json
    def index
      @q = Phalange.order(created_at: :asc).ransack(params[:q])
      @phalanges = @q.result
      @phalanges = @phalanges.page(params[:page])
    end

    # GET /admin/phalanges/1 or /admin/phalanges/1.json
    def show; end

    # GET /admin/phalanges/new
    def new
      @phalange = Phalange.new
    end

    # GET /admin/phalanges/1/edit
    def edit; end

    # POST /admin/phalanges or /admin/phalanges.json
    def create
      @phalange = Phalange.new(phalange_params)

      respond_to do |format|
        if @phalange.save
          format.html { redirect_to admin_phalange_url(@phalange), notice: "Phalange was successfully created." }
          format.json { render :show, status: :created, location: @phalange }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @phalange.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/phalanges/1 or /admin/phalanges/1.json
    def update
      respond_to do |format|

        params[:phalange].delete(:password) if params[:phalange][:password].blank?
        params[:phalange].delete(:password_confirmation) if params[:phalange][:password].blank?

        if @phalange.update(phalange_params)
          format.html { redirect_to admin_phalange_url(@phalange), notice: "Phalange was successfully updated." }
          format.json { render :show, status: :ok, location: @phalange }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @phalange.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/phalanges/1 or /admin/phalanges/1.json
    def destroy
      @phalange.destroy

      respond_to do |format|
        format.html { redirect_to admin_phalanges_url, notice: "Phalange was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_phalange
      @phalange = Phalange.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phalange_params
      params.require(:phalange).permit!
    end
end
