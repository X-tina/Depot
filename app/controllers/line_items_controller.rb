class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
   
  def index
    @line_items = LineItem.all # не получается отсортировать список товарных позиций в корзине
    #@products = Product.order(:title)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  
  def create 
  
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
 
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_url }
        format.js {@current_item = @line_item}
        format.json { render json: @line_item, status: :created, location: @line_item }

      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end




  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        #if (@line_item.quantity == 0)
         # @line_item.destroy
        #end
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        #format.html {redirect_to(@line_item.cart, notice: 'Removed')}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  
  def destroy
    @line_item = LineItem.find(params[:id])
   # @line_item.destroy
  #if @line_item.quantity > 1
   # @line_item.update_attributes(:quantity => @line_item.quantity-1)
  #else
    @line_item.destroy
  #end
    respond_to do |format|
      #format.html {redirect_to (cart_url(session[:cart_id]))}
      format.html {redirect_to (store_url(session[:cart_id]))}
      #format.html { redirect_to line_items_url }
      #format.json { head :ok }
      #format.html {redirect_to(store_url, :notice => 'Line Item Removed')}
      #if current_cart.line_items.empty?
       # format.html { redirect_to(store_url, notice: 'Your cart is empty') }
      #else
       # format.html { redirect_to(@line_item.cart, :notice => 'Item has been removed from your cart.') }       # format.html { redirect_to(current_cart, notice: 'Item Removed') }
      #end

     # if LineItem.find_by_cart_id (@line_item.cart_id).nil?
      #  format.html {redirect_to store_url, notice: 'your cart is currently empty'}
      #else format.html {redirect_to current_cart, notice: 'Line item removed'}
      #end

      #format.html {redirect_to :back}
      format.json {head :ok}
    end
  end

  #def decrement
   # @cart = current_cart

    #1 way: decrement throught method in @cart
    #@line_item = @cart.decrement_line_item_path_quantity(params[:id]) #passing in line_item.id

    #2 way: decrement throught method in @line_item
    #@line_item = @cart.line_items.find_by_id(params[:id])
    #@line_item = @line_item.decrement_quantity(@line_item.id)
    #respond_to do |format|
     # if @line_item.save
      #  format.html {redirect_to store_path, notice: 'Line item was successfully updated.'}
       # format.js {@current_item = @line_item}
        #format.json {head :ok}
      #else
       # format.html {render avtion: "edit"}
        #format.js {@current_item=@line_item}
        #format.json {render json: @line_item.errors, status: :unprocessable_entity}
      #end
   # end
 # end

  def decrease
    @cart= current_cart

    #before_action :set_cart, only: [:create, :decrease]
    @line_item=@cart.decrease(params[:id])

    respond_to do |format|
      if @line_item.save
        format.html {redirect_to store_path, notice: 'Line item was successfully updated.'}
        format.js {@current_item = @line_item}
        format.json {head :ok}
      else
        format.html {render action: "edit"}
        format.json {render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

 def increase
  @cart = current_cart
  #before_action :set_cart, only: [:create, :increase]
  @line_item = @cart.increase(params[:id])

  respond_to do |format|
    if @line_item.save
        format.html { redirect_to store_path, notice: 'Line item was successfully updated.' }
        format.js   { @current_item = @line_item }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  
 end

end
