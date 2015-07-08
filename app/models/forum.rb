class Forum < ActiveRecord::Base
  has_many :listings, dependent: :destroy
end
