class Category < ActiveRecord::Base
  has_many :listings, dependent: :destroy
  has_many :subcategories, dependent: :destroy
  acts_as_taggable

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
