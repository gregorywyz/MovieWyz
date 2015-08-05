class User < ActiveRecord::Base

  has_secure_password

  validates :name,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_presence_of :password, on: :create

  def self.authenticate name, password
    User.find_by_name(name).try(:authenticate, password)
  end

end
