class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  # layout "admin" Éste layout afecta a todas las vistas.
  # layout "admin" #, only[:index, :delete] # O también except, a todas menos a las mencionadas
  # layout false, no aplica ningún layout.

  def index
    # render layout: "admin" Sólo afecta ésta vista
    @users = User.all.order(created_at: :desc)
    @posts = Post.all.order(created_at: :desc)
    @comments = Comment.all.count
    @subscriptors = Subscriptor.all.order(created_at: :desc)
  end

  def products
    @products = Product.all.order(created_at: :desc)
  end

  private
  def is_admin?
    unless current_user.admin?
      flash[:alert] = "You don't have permissions"
      redirect_to root_path
    end
  end
end
