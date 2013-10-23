class UsersController < ApplicationController
	before_action :set_user, except: :index
	skip_before_filter :verify_authenticity_token, only: :send_message
  def index
  	@users = User.all
  end

  def show 
  end


  def send_message
  	current_user.send_message(@user, params[:message_body], params[:message_subject])
  	redirect_to user_path(@user)
  end

  private
  	def set_user
  		@user  = User.find(params[:id])
  	end
end
