class MessagesController < ApplicationController
  def index
    require_login
    
    @readable = true;
    
    if params[:id]
      @messages = get_message_per_page(Message.where(id: params[:id]))
    else
      @messages = get_message_per_page(current_user.messages.order(unread: :desc, created_at: :desc))
    end
  end

  def new
    require_login

    init_message
  end

  def create
    data = send_params
    recipients = data[:recipients].map { |recipient| User.where(email: recipient) }
    sender = current_user

    if recipients.presence
      message = Message.new(content: data[:content], images: data[:images], unread: true, user_id: sender.id)
      
      if message.save
        message.users << recipients

        #MessageMailer.sent_message(message, get_root_path).deliver_later

        flash[:success] = 'Message sent!'
      else
        flash[:error] = message.errors.full_messages.join(', ')
      end
    else
      flash[:error] = 'Recipient not found!'
    end

    redirect_to messages_new_path
  end

  def sent
    require_login

    @readable = false;
    @messages = get_message_per_page(@current_user.sent_messages.order(unread: :desc, created_at: :desc))
  end

  def unread
    json = JSON.parse(request.body.read)
    message = Message.find(json['id'])

    respond_to do |format|
      if message.presence && message.unread && message.update_attributes({ unread: false, read_time: DateTime.now })
        format.json {render json: {readTime: message.read_time}, status: :ok}
      else
        format.json { render json: message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def send_params
      params.require(:message).permit(:content, {images: []}).merge({recipients: params.require(:recipients)})
    end

    def init_message
      @message = Message.new
      @message.sender = current_user

      if params[:recipient]
        @message.users << User.find_by_email(params[:recipient])
      end
    end

    def get_message_per_page(messages)
      messages.page params[:page]
    end
end
