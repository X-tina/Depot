require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

   

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:Darsil).id
    end
    assert_redirected_to store_path
    #assert_redirected_to cart_path(assigns(:line_item).cart)
    #assert_redirected_to cart_path(assigns(:line_item).cart)
  end

  test "should show line_item" do
    get :show, id: @line_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item.to_param
    assert_response :success
  end

  test "should update line_item" do
    put :update, id: @line_item.to_param, line_item: @line_item.attributes
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item.to_param
    end
    assert_redirected_to line_items_path
    #assert_equal 2, LineItem.count
    #assert_redirected_to cart_path (session [:cart_id])
    #assert(!@cart.line_items.empty?, 'Cart should not be empty')
      
    #assert_redirected_to line_items_path
    #format.html {redirected_to(@line_iyem.cart, notice: 'Removed item')}
    #aseert_redirected_to Cart.find(session[:cart_id])
  end

  test "should create line_items via ajax" do
    assert_difference('LineItem.count') do
      xhr :post, :create, product_id: products(:Darsil).id
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_item td', /Darsil N 100/
    end
  end

  #test "should redirect to store if cart is empty" do
   # assert_difference ('LimeItem.count',-3) do
    #  delete :destroy, id: @line_item.to_param
     # delete :destroy, id: line_items(:two).to_param
      #delete :destroy, id: line_items(:three).to_param
    #end
    #assert_equal 0, LineItem.count
    #assert_redirected_to store_url
  #end

end
