class User < ApplicationRecord
  include Clearance::User

  validates :email, inclusion: { in: proc { EmailWhitelist.pluck(:email) }, message: "%{value} rejected" }

  validates :name, presence: true
end
