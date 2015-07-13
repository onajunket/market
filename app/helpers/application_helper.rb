module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Comprar Marketplace"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def gravatar_for_messages(user, size = 30, title = user.name)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, title: title, class: "gravatar")
  end
end
