class WelcomeMailer < ActionMailer::Base
  default from: "from@example.com"

  def decor(user)
    @user = user
    @name = @user.name
    @email = @user.email
  #  @greeting = greeting
    if Template.find_by_name('Reset password')
      temp = Template.find_by_name('Reset password')
      template = Liquid::Template.parse(temp.content.html_safe)
      @template = template.render("name" => @name, "email" => @email)
    end
  end

  def welcome_email(user)
    temp = Template.find_by_name('Mail confirmation')
    template = Liquid::Template.parse(temp.content.html_safe)
    @template = template.render("name" => @name, "email" => @email)
    mail(to: @email, subject: "Welcome, new user!")
  end

  def reset_password_instructions(user, password)
    @template
    decor(user)

    mail(to: @email, subject: "Reset password instructions")
  end
end


