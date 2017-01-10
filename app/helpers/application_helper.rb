module ApplicationHelper
  def login_link
    if current_user
      link_to "Logout", destroy_user_session_path, method: :delete
    else
      link_to "Login", new_user_session_path
    end
  end
end