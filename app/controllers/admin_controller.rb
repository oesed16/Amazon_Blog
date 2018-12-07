class AdminController < ApplicationController

  # Si se desean vistas con JavaScript y CSS diferentes.

  # layout "admin" Éste layout afecta a todas las vistas.
  layout "admin" #, only[:index, :delete] # O también except, a todas menos a las mencionadas
  # layout false, no aplica ningún layout.

  def index
    # render layout: "admin" Sólo afecta ésta vista
  end
end
