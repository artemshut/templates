class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #:confirmable

  attr_accessible :email, :name, :admin, :password, :password_confirmation, :remember_me, :confirmation_token, :confirmed_at, :roles

  has_many :posts,  dependent: :destroy

  has_many :comments, dependent: :destroy


  scope :with_role, lambda { |role| {conditions: "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  ROLES = %w[admin moderator author]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role?(role)
    roles.include? role.to_s
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
