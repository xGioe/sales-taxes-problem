require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @category = categories(:cat_with_fee)
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    @new_product = { name: 'kiwi', price: 12.50, imported: false, category_id: @category.id, qnty: 2 }
    assert_difference('Product.count') do
      post :create, product: @new_product
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { name: @product.name, price: @product.price, imported: @product.imported, category_id: @category.id, qnty: @product.qnty }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  test "should redirect to new category if no category exists" do
    Category.destroy_all
    get :new, id: @product
    assert_redirected_to new_category_path
  end
end
