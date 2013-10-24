class ConversationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:reply, :start]
  before_action :set_conversation, except: :start

  def show
    @conversation.receipts_for(current_user).last.message.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:reply_body])
    redirect_to conversation_path(@conversation)
  end

  def move_to_trash
    @conversation.move_to_trash(current_user)
    redirect_to inbox_path
  end

  def restore
    @conversation.untrash(current_user)
    redirect_to trash_path
  end

  def delete
    current_user.mark_as_deleted(@conversation)
    redirect_to trash_path
  end

  def start
  end

  private 
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end 
end
