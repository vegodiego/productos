class ProductsController < ApplicationController
	def index
		@product=Product.all
	end

	def new
		@product=Product.new
	end

	def product_params
		params.require(:product).permit(:name, :price)
	end

	def create
		product=Product.new(product_params)
		if product.save
			if params[:perfumes]=="1" 
				Category.find(1).products<<product
			end
			if params[:libros]=="1" 
				Category.find(2).products<<product
			end
			if params[:tecnologia]=="1" 
				Category.find(3).products<<product
			end
			if params[:electrodomesticos]=="1" 
				Category.find(4).products<<product
			end
			if params[:aseo]=="1" 
				Category.find(5).products<<product
			end
			if params[:juguetes]=="1" 
				Category.find(6).products<<product
			end
			if params[:ropa]=="1" 
				Category.find(7).products<<product
			end
			if params[:oficina]=="1" 
				Category.find(8).products<<product
			end
			if params[:mascota]=="1" 
				Category.find(9).products<<product
			end
			redirect_to products_path
		else
			render :new
		end
	end

	def edit
		@product=Product.find(params[:id])
	end

	def update
		product=Product.find(params[:id])

		Category.find(1).products.delete(product)
		Category.find(2).products.delete(product)
		Category.find(3).products.delete(product)
		Category.find(4).products.delete(product)
		Category.find(5).products.delete(product)
		Category.find(6).products.delete(product)
		Category.find(7).products.delete(product)
		Category.find(8).products.delete(product)
		Category.find(9).products.delete(product)
		product.categories=[]


		if product.update(product_params)
			if params[:perfumes]=="1" || params[:perfumes]=="yes"
				Category.find(1).products<<product
			end
			if params[:libros]=="1" || params[:libros]=="yes"
				Category.find(2).products<<product
			end
			if params[:tecnologia]=="1" || params[:tecnologia]=="yes"
				Category.find(3).products<<product
			end
			if params[:electrodomesticos]=="1" || params[:electrodomesticos]=="yes" 
				Category.find(4).products<<product
			end
			if params[:aseo]=="1" || params[:aseo]=="yes"
				Category.find(5).products<<product
			end
			if params[:juguetes]=="1" || params[:juguetes]=="yes"
				Category.find(6).products<<product
			end
			if params[:ropa]=="1" || params[:ropa]=="yes" 
				Category.find(7).products<<product
			end
			if params[:oficina]=="1" || params[:oficina]=="yes" 
				Category.find(8).products<<product
			end
			if params[:mascota]=="1" || params[:mascota]=="yes" 
				Category.find(9).products<<product
			end
			redirect_to products_path
		else
			render :edit
		end
	end

	def destroy
	  product = Product.find(params[:id])
	  product.destroy

	  redirect_to products_path
	end


end