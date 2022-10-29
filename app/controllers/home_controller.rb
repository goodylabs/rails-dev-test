class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @products = Product.all.paginate(page: params[:page], :per_page => 6).order(:name)
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

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.permit(:name, :price)
  end

end
