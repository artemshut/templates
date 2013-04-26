class Template < ActiveRecord::Base
  attr_accessible :content, :name

  liquid_methods :content

end
