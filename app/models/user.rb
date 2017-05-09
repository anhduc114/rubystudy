class User < ActiveRecord::Base
      before_save { self.email = email.downcase }
       
       has_secure_password
       attr_accessor :email, :name, :password, :password_confirmation
 validates_length_of :password, :in => 6..20, :on => :create
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                      validates :password, presence: true, length: { minimum: 6 }
                      
end
