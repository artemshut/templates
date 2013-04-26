class WelcomeMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    temp = Template.find_by_name('Mail confirmation')
    template = Liquid::Template.parse(temp.content.html_safe)
    @template = template.render("name" => @user.name, "email" => @user.email)
    mail(to: user.email, subject: "Welcome, new user!")
  end

  def reset_password_instructions(user, password)
    @user = user
    temp = Template.find_by_name('Reset password')
    template = Liquid::Template.parse(temp.content.html_safe)
    @template = template.render("name" => @user.name, "email" => @user.email)
    mail(to: user.email, subject: "Reset password instructions")
  end
end

