class MessagesController < ApplicationController
  def create
    @new_message = current_user.messages.build(message_params)
    @user = current_user

    if @new_message.save
      @new_message.broadcast_append_to @new_message.chat, notice: "New question created!"
      flash.now[:notice] = "You have new message ' #{@new_message.body} ' from User: #{@user.email}"
      Sounder::Sound.new("#{Rails.root}/app/assets/audios/notification.mp3").play
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end
