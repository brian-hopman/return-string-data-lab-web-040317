class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def create
    @product = Product.create(products_params)
    @product.save
    redirect_to products_path
  end

  def inventory
    @product = Product.find(params[:id])

    if @product.inventory != 0
      render text: 'true'
    else
      render text: 'false'
    end
  end


  private

  def products_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
