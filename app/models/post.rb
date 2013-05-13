class Post < ActiveRecord::Base

  MAX_FEATURED = 4
  MAX_BOOST = 5

  self.per_page = 3

  attr_accessible :title, :content, :avatar, :featured

  validate :validates_featured_count

  validates_presence_of :title, :content
  validates_uniqueness_of :title
  validates_length_of :title, within: 5..40


  has_many :comments, dependent: :destroy

  belongs_to :user

  has_one :avatar, dependent: :destroy

  searchable do
    text :title, boost: MAX_BOOST
  end

  private

  def validates_featured_count
    errors.add(:featured, "too much featured news") if self.featured && Post.find_all_by_featured(:true).count() == MAX_FEATURED
  end
end



