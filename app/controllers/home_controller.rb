class HomeController < ApplicationController
  def index
    @products = Product.all
  end

  def add
    @product = Product.new
  end

  def create
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Successfully created product.#{@product.name}"
        redirect_to root_path 
        else
        render :action => 'add'
      end
  end
  private
  def product_params
    params.permit(:name, :price)
  end

end
