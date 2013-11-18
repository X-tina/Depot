class StoreController < ApplicationController
  skip_before_filter :authorize
  #def visit_count
  #	if session[:counter].nill?
  #		session[:counter]=0
  #	end
  #	session[:counter] +=1
  #end

  def index
  	
    if params[:set_locale]
        redirect_to store_path(locale: params[:set_locale])
    else
        @products = Product.order(:title)
        @cart = current_cart
    end
    #@count=visit_count
    #@counter = session[:counter]
    #@counter.nil? @counter = 1 : #@counter+=1
    #session[:counter] = @counter
  end

end
