class Admin::DashboardController < ApplicationController
  def show
    @total_products = Product.count(:id)
    @total_products_quantities = Product.sum(:quantity)
    @total_categories = Category.count(:id)
  end
end
