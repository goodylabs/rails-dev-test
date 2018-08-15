class PagesController < ApplicationController
  def index
    @products = Product.all.in_stock
  end
end