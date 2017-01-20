require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { designation: @profile.designation, employment_type: @profile.employment_type, faculty: @profile.faculty, field_of_knowledge: @profile.field_of_knowledge, full_name: @profile.full_name, mobile_telephone_number: @profile.mobile_telephone_number, office_telephone_number: @profile.office_telephone_number, personal_skills: @profile.personal_skills, qualification: @profile.qualification, salutation: @profile.salutation, staff_id: @profile.staff_id, technical_skills: @profile.technical_skills }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { designation: @profile.designation, employment_type: @profile.employment_type, faculty: @profile.faculty, field_of_knowledge: @profile.field_of_knowledge, full_name: @profile.full_name, mobile_telephone_number: @profile.mobile_telephone_number, office_telephone_number: @profile.office_telephone_number, personal_skills: @profile.personal_skills, qualification: @profile.qualification, salutation: @profile.salutation, staff_id: @profile.staff_id, technical_skills: @profile.technical_skills }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
