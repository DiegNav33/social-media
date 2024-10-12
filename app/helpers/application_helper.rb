module ApplicationHelper
  def devise_page?
    # Vérifie si l'URL actuelle correspond à une des pages de Devise
    request.path == new_user_session_path ||
    request.path == new_user_registration_path ||
    request.path == new_user_password_path ||
    request.path == user_registration_path ||
    request.path == user_password_path
    # request.path == new_user_confirmation_path ||
    # request.path == new_user_unlock_path
  end
end
