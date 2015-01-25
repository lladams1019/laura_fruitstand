class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
  	product_params = params.require(:product).permit(:name, :image, :price)

  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to product_path(@product), notice: "Product Created"
  	else
  		render :new
  	end
  end

	def update
	product_params = params.require(:product).permit(:name, :image, :price)

	  	@product = Product.find(params[:id])
	  	@product.update_attributes(product_params)
	  	if @product.save
	  		redirect_to product_path(@product), notice: "Product Created"
	  	else
	  		render :edit
	  	end

	end

end
