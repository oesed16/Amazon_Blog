require 'test_helper'

class SubscriptorsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @subscriptor = subscriptors(:one) # Se crea para que en "should create a new subscriptor" se puedan poner las variables de instancia y no valores quemados.
  end
  
  test "should get index" do 
    get subscriptors_url
    # get :index
    assert_response :success
  end

  test "should get new" do
    get new_subscriptor_url
    assert_response :success
  end

  # test "should get create" do
  #   get subscriptors_create_url
  #   assert_response :success
  # end

  test "should create a new subscriptor" do
    assert_difference('Subscriptor.count') do
      post subscriptors_url, params: { subscriptor: { email: @subscriptor.email, name: @subscriptor.name}}
    end  

    assert_redirected_to posts_path
  end

  test "should show subscriptor" do
    get subscriptor_url(@subscriptor)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscriptor_url(@subscriptor)
    assert_response :success
  end

  test  "should update subscriptor" do
    patch subscriptor_url(@subscriptor), params: { subscriptor: { email: @subscriptor.email, name: @subscriptor.name}}
    assert_redirected_to subscriptor_url(@subscriptor)
  end

  test "should destroy subscriptor" do 
    assert_difference('Subscriptor.count', -1) do
      delete subscriptor_url(@subscriptor)
    end
    assert_redirected_to subscriptors_url
  end

end
