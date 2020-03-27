module PermissionHelper
  def is_admin?
    user_signed_in? && current_user.role == "admin"
  end
end
