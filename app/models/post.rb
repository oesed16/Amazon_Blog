class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category # optional: true, en caso de no estar asociado a una categoría.
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true
  
  #scope :published, -> { where(published: true) }
  # Acá debe coincidir la variable después del where, con la de la base de datos porque se está haciendo una cosulta directamente a ésta.
  #scope :popular, -> { where("views > ?", 10) }
  

  # :phone
  # validates :phone, numericality: { only_integer: true }

  # :points
  # validates :points, numericality: { greater_than: 5 }
  # validates :points, numericality: { greater_than_or_equal_to: 5 }
  # validates :points, numericality: { equal_to: 5 }
  # validates :points, numericality: { less_than: 5 }

  # Otra forma de hacer un scope, no recomendable
    # def published
    #   self.published == true
    # end
end
