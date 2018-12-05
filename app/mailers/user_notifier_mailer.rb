class UserNotifierMailer < ApplicationMailer
    default from: 'hello@amazon-clone.com' 

    # Send a subscribe email to the subscriptor
    def send_subscribe_email(subscriptor)
        @subscriptor = subscriptor
        @subject = "Thanks for subscribe for our amazing app"
        mail(to: @subscriptor.email, subject: @subject)
        # Mail recibe tres parámetros mail(to: , from: , subject: )
    end

    # def cancel_account(subscriptor, admin, content)

    # end
end
