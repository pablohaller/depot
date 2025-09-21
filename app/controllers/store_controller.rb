class StoreController < ApplicationController
  allow_unauthenticated_access
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
  end
end
