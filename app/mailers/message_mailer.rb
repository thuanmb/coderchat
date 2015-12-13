class MessageMailer < ApplicationMailer
  default from: 'coderchat@example.com'

  def welcome_email(user, root_path) 
    @user = user
    @url = "#{root_path}/login"
    mail(to: @user.email, subject: 'Welcome to Coder Chat')
  end

  def sent_message(message, root_path)
    @message = message
    @url = "#{root_path}/messages/new?recipient=#{message.sender.email}"
    @url_view = "#{root_path}/messages?id=#{message.id}"

    @message.users.each do |user|
      mail(to: user.email, subject: "You have new messages from #{message.sender.name}") 
    end
  end
end
