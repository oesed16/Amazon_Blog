class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :is_admin?, only: [:edit, :update, :destroy]

  def index
    if params[:category].blank?
      @posts = Post.all
                   .order(created_at: :desc)
                   .paginate(page: params[:page], per_page: 2) #current_user.posts # Post.all si no tiene lógica de validación y deseo mostrar todos los post, sin importar el usuario.
      @last_post = Post.last
      @shoes_category = Category.find_by(name: "Shoes")
      @shoes_last_post = @shoes_category.posts.last
      @t_shirt_category = Category.find_by(name: "T-Shirt")
      @t_shirt_last_post = @t_shirt_category.posts.last
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id)
                   .order(created_at: :desc)
                   .paginate(page: params[:page], per_page: 2)
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 1)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user #Está asignando un post/posts a un usuario.

      if @post.save
        # Send email to users with new post link 
        title = @post.title
        id = @post.id
        users = User.where(role: "user")

        users.each do |user|
          user_email = user.email
          UserNotifierMailer.new_post_notifying_user(user_email, title, id).deliver_now
        end

        redirect_to posts_path, notice: "Post created successfully"
      else
        flash[:alert] = "The register of the post failed, try again"
        render :new 
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post updated successfully"  
    else
      render :edit, alert: "Post edition failed, try again"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    # flash[:notice] = "The post was destroy sucessfully" una forma de hacerlo, se recomienda la siguiente.
    # notice se usa cuando se realizó la acción deseada, alert cuando no.
    redirect_to posts_path, notice: "Post destroyed successfully"
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :category_id)
    end
    # def validate_user
    #   unless current_user.posts.ids.to_s.include? params[:id]
    #     redirect_to root_path
    #     flash[:alert] = "You don't have permissions"
    #   end
    # end
    def is_admin?
      unless current_user.admin?
        flash[:alert] = "You don't have permissions"
        redirect_to root_path
      end
    end
end
