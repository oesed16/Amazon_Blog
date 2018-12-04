class Blog2Controller < ApplicationController
  
  # Redirect
  def index
  end

  def new
    #get
  end

  def create
    #post
    # Transacción en la base de datos.

    if condition
      # Si se cumple
      redirect_to blog2_index_path
    else
      #Si falla
      render :new
    end
  end

  def edit
    #get
  end 

  def update
    #post / put / patch
    if condition
      # Si se cumple
      redirect_to blog2_index_path
    else
      #Si falla
      render :edit
    end
  end

  def delete
    #post / delete/destroy
  end

  def show
  end
end
