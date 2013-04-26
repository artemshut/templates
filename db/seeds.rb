# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  def confirmation_mail
      if Template.find_by_name('Mail confirmation').nil?
        content =  File.read('config/mails_templates/confirmation_instructions.html.erb')
        confirmation = Template.create([{name: 'Mail confirmation',  content: content}])
      else
      end
  end

  def reset_password_email
      if Template.find_by_name('Reset password').nil?
        content_reset =  File.read('config/mails_templates/reset_password.html.erb')
        reset = Template.create([{name: 'Reset password',  content: content_reset}])
       else
      end
  end

  reset_password_email
  confirmation_mail