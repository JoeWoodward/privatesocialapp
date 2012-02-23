module Your::UsersHelper
  def payment_link
    if current_user.is_admin?
      nil
    elsif current_user.state == nil
      link_to 'Complete registration', register_now_path, class: 'button'
    else
      link_to 'Update billing info', update_billing_details_path, class: 'button'
    end
  end

  def toggle_activation_link
    if current_user.is_admin?
      nil
    elsif current_user.active?
      link_to 'Cancel your subscription?', cancel_subscription_path, class: 'button', :confirm => 'Are you sure? This will cancel your subscription'
    elsif current_user.inactive?
      link_to 'Re-subscribe', resubscribe_path, class: 'button', :confirm => "Accepting will charge the card registered to you account! Are you sure?"
    end
  end
end
