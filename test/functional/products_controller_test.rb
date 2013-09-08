require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
     @update={
      title: 'Askofen-D N 6',
      description: 'Askofen-Darniza tablets numb 6',
      image_url: 'http://web-apteka.com/photos/b/3625.jpg',
      price: 1.8900
     }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    #assert_select '#product_list' # checks if the div with id “product_list” is being displayed
    #assert_select '.list_actions a', minimum =>3 # checks if there are at least three actions (show, edit, destroy) being displayed
    #assert_select '.list_actions' do |elements|
     # elements.each do |elem|
      #  assert_select elem, "a", 3
      #end
    #end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product.to_param
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product.to_param, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.to_param
    end

    assert_redirected_to products_path
  end
end
