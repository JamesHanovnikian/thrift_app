class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      category: params[:category],
      size: params[:size],
    )
    product.save
    render json: product.as_json
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: photo.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.category = params[:category] || product.category
    product.size = params[:size] || product.size
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: "Product is succesfully removed"
  end
end
