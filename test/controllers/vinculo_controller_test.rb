require 'test_helper'

class VinculoControllerTest < ActionController::TestCase
  test "should get id_quarto:integer" do
    get :id_quarto:integer
    assert_response :success
  end

  test "should get id_usuario:intege" do
    get :id_usuario:intege
    assert_response :success
  end

end
