class Subcategory < ActiveRecord::Base
   has_many :listings, dependent: :destroy
   belongs_to :category


  private
    def subcategory_params
      params.require(:subcategory).permit(:category_id, :name, :category)
    end

end
