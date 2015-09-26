require 'test_helper'

class BetslipsControllerTest < ActionController::TestCase
  setup do
    @betslip = betslips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:betslips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create betslip" do
    assert_difference('Betslip.count') do
      post :create, betslip: { stake: @betslip.stake, status: @betslip.status, total_odds: @betslip.total_odds, winnings: @betslip.winnings }
    end

    assert_redirected_to betslip_path(assigns(:betslip))
  end

  test "should show betslip" do
    get :show, id: @betslip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @betslip
    assert_response :success
  end

  test "should update betslip" do
    patch :update, id: @betslip, betslip: { stake: @betslip.stake, status: @betslip.status, total_odds: @betslip.total_odds, winnings: @betslip.winnings }
    assert_redirected_to betslip_path(assigns(:betslip))
  end

  test "should destroy betslip" do
    assert_difference('Betslip.count', -1) do
      delete :destroy, id: @betslip
    end

    assert_redirected_to betslips_path
  end
end
