class User < ActiveRecord::Base
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validate :matching_passwords
  validate :email_nil
  def matching_passwords #If the user's passwords don't match, The server (in users_actions.rb) will return password as false.
    if password == false
      errors.add(:passwords, "Must Match")
    end
  end

  def email_nil
    if email != nil
      if User.find_by email: email
        errors.add(:email, "is already in use.")
      end
    end
  end

  has_many :comments
  has_many :documents
end