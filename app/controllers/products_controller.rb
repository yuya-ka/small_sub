class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @products = Product.all
    # 検索条件を追加
    if params[:search].present?
      @products = @products.where("name LIKE ?", "%#{params[:search]}%")
    end
    # ソート条件を追加
    @name_sort = params[:name_sort] || 'asc'
    @desc_sort = params[:desc_sort] || 'asc'
    @price_sort = params[:price_sort] || 'asc'
    @quantity_sort = params[:quantity_sort] || 'asc'
    @category_sort = params[:category_sort] || 'asc'
    @status_sort = params[:status_sort] || 'asc'
    @products = @products.order(name: @name_sort) if params[:name_sort].present?
    @products = @products.order(description: @desc_sort) if params[:desc_sort].present?
    @products = @products.order(price: @price_sort) if params[:price_sort].present?
    @products = @products.order(quantity: @quantity_sort) if params[:quantity_sort].present?
    @products = @products.order(category: @category_sort) if params[:category_sort].present?
    @products = @products.order(status: @status_sort) if params[:status_sort].present?
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image_url, :quantity, :customer_name, :customer_email)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
