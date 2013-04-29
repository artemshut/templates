class WelcomeMailer < ActionMailer::Base
  default from: "from@example.com"

  def mail_variables(user)
    @user = user
    @name = @user.name
    @email = @user.email
    @greeting = "Hello world #{@name}"
  end

  def welcome_email(user)
    mail_variables(user)
    current_template = Template.find_by_name('Mail confirmation')
    template = Liquid::Template.parse(current_template.content)
    @template = template.render("name" => @name, "email" => @email, "greeting" => @greeting)
    mail(to: @email, subject: "Welcome, new user!")
  end

  def reset_password_instructions(user, password)
    mail_variables(user)
    current_template = Template.find_by_name('Reset password')
    template = Liquid::Template.parse(current_template.content)
    @template = template.render("name" => @name, "email" => @email)
    mail(to: @email, subject: "Change password")
  end
end


