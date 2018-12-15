require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
    test 'login and browse' do
        get '/users/sign_in'
        post '/users/sign_in', params: { user: {email: users(:andres).email, password: 'andres123' } }
        follow_redirect! # método de test para seguir una ruta después de un path
        assert_equal '/', path
        assert_equal 'Signed in successfully.', flash[:notice]
    end
end