class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!

  before_action :admin_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @group = Product.find(params[:id])

    if @group.update(product_params)
      redirect_to admin_products_path #, notice: "修改討論版成功"
    else
      render :edit
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price)
  end
end
