class Admin::CategoriesController < AdminController
  before_action :set_category, only: %i[edit update destroy show]

  def index
    @search = Category.ransack(params[:q])
    @categories = @search.result.page(params[:page]).order("name asc")
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = "A Categoria #{@category.name} foi criado com Sucesso."
    else
      render :new
      flash[:alert] = "A Categoria não foi cadastrado!"
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:success] = "A Categoria #{@category.name} foi atualizado com Sucesso."
    else
      render :edit
      flash[:alert] = "A Categoria não foi atualizado!"
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to admin_categories_path, success: 'A Categoria foi excluido com Sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit!
  end
end
