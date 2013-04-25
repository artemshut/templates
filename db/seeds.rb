# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  content =  File.read('config/mails_templates/sign_up_confirm.txt')
  sign_up_template = Template.create([{name: 'Reset password',  content: content}])
