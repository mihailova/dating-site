class MessagingController < ApplicationController
  
  def inbox
  	@inbox = current_user.mailbox.inbox
  end

  def sentbox
  	@sentbox = current_user.mailbox.sentbox
  end

  def trash
  	@trash= current_user.mailbox.trash
  end
end
