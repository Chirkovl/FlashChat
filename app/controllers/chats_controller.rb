class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @new_chat = Chat.new
  end

  def show
    @chat = Chat.find_by!(title: params[:title])
    @messages = @chat.messages.includes(:user)
    @new_message = current_user&.messages&.build(chat: @chat)
  end

  def create
    @new_chat = Chat.new(chat_params)
    if @new_chat.save
      @new_chat.broadcast_append_to(:chats)
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:title)
  end
end
