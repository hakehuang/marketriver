class Customer < ActiveRecord::Base
  belongs_to :user
  attr_protected :credits
end
