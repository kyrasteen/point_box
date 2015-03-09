class Point < ActiveRecord::Base
  belongs_to :user
  # validates :redeemed?, presence: true
end
