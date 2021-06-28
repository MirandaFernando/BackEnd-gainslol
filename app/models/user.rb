class User < ActiveRecord::Base

  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  include DeviseTokenAuth::Concerns::User
  
  has_many :bets, dependent: :destroy
  
  before_validation :set_uid

  private

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

end
