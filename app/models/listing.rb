class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  belongs_to :category
  belongs_to :subcategory
  validates :user_id, presence: true
  validates :title, presence: true
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  mount_uploader :picture, PictureUploader
  acts_as_taggable

private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
