class SubscriptorsController < ApplicationController
  
  layout "signin"
  def new
    @subscriptor = Subscriptor.new
  end

  def create
    @subscriptor = Subscriptor.new(subscriptor_params)
      if @subscriptor.save

        # send subscriptor mail
        UserNotifierMailer.send_subscribe_email(@subscriptor).deliver_now

        redirect_to posts_path, notice: "Subscription created successfully"
      else
        flash[:alert] = "The subscription failed, try again"
        render :new 
      end
  end

  private
    
  def subscriptor_params # Éste método se conoce como Strong parameters
      params.require(:subscriptor).permit(:name, :email)
  end
end
