module Your::UsersHelper
  def payment_link
    if current_user.is_admin?
      nil
    elsif current_user.state == nil
      link_to 'Complete registration', register_now_path
    else
      link_to 'Update billing info', update_billing_details_path
    end
  end
end
