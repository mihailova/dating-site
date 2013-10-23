class MessagingController < ApplicationController

	skip_before_filter :verify_authenticity_token, only: :reply
  
  def inbox
  	@inbox = current_user.mailbox.inbox
  end

  def sentbox
  	@sentbox = current_user.mailbox.sentbox
  end

  def trash
  	@trash= current_user.mailbox.trash
  end

  def show_conversation
  	@conversation = Conversation.find(params[:id])
  	@conversation.receipts_for(current_user).last.message.mark_as_read(current_user)
  end

  def reply
  	@conversation = Conversation.find(params[:id])
  	current_user.reply_to_conversation(@conversation, params[:reply_body])

  	redirect_to conversation_path(@conversation)
  end
end
