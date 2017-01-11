require 'test_helper'

class ProgrammeSessionsControllerTest < ActionController::TestCase
  setup do
    @programme_session = programme_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:programme_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create programme_session" do
    assert_difference('ProgrammeSession.count') do
      post :create, programme_session: { active: @programme_session.active, completed: @programme_session.completed, end_date: @programme_session.end_date, name: @programme_session.name, start_date: @programme_session.start_date }
    end

    assert_redirected_to programme_session_path(assigns(:programme_session))
  end

  test "should show programme_session" do
    get :show, id: @programme_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @programme_session
    assert_response :success
  end

  test "should update programme_session" do
    patch :update, id: @programme_session, programme_session: { active: @programme_session.active, completed: @programme_session.completed, end_date: @programme_session.end_date, name: @programme_session.name, start_date: @programme_session.start_date }
    assert_redirected_to programme_session_path(assigns(:programme_session))
  end

  test "should destroy programme_session" do
    assert_difference('ProgrammeSession.count', -1) do
      delete :destroy, id: @programme_session
    end

    assert_redirected_to programme_sessions_path
  end
end
