class User < ActiveRecord::Base
   
  include BCrypt

  has_many :created_events
  has_many :events through: :created_events

  has_many :attended_events
  
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /.+@.+\../
  validates :password, presence: true 

  def password=(secret)
    return if secret == ''
    @password = Password.create(secret)
    self.password_digest = @password
  end

  def password
    return unless password_digest
    @password ||= Password.new(self.password_digest)
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil  
  end
end
