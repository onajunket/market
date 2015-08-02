module MessagesHelper

  # This is the helper for grabbing a User
  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' #{'selected' if user == chosen_recipient}>#{user.name}</option>"
    end
    s.html_safe
  end

  # This is the helper for grabbing the Title from Listing
  # def recipient_subject(chosen_subject = nil)
  #   s = ''
  #   Listing.all.each do |subject|
  #   s << "<option value='#{subject.id}' #{'selected' if subject == chosen_subject}>#{subject.title}</option>"
  #   end
  #   s.html_safe
  # end
end
