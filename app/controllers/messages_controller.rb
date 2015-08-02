class MessagesController < ApplicationController
  before_action :logged_in_user


  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]

    # @chosen_subject = Listing.find_by(title: params[:title].to_i) if params[:title]
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

end
