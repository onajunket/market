class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @listing = current_user.listings.build
      @feed_listings = current_user.feed.paginate(page: params[:page])
    end
      @categories  = Category.all
      @subcategories = Subcategory.all
  end

  def update_subcategories

    # updates artists and songs based on genre selected
    category = Category.find(params[:category_id])
    # map to name and id for use in our options_for_select
    @subcategories = category.subcategories.map{|a| [a.name, a.id]}.insert(0, "Select a Product")
  end

  def help
  end

  def about
  end

  def contact
  end
end
