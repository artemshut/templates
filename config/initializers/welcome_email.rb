module Devise::Models::Confirmable

# Override Devise's own method. This one is called only on user creation, not on subsequent address modifications.
  def send_on_create_confirmation_instructions
    WelcomeMailer.welcome_email(self).deliver
  end

  def reset_password_instructions
    WelcomeMailer.reset_password(self).deliver
  end
end