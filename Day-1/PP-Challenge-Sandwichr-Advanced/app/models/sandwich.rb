class Sandwich < ActiveRecord::Base
  has_many :sandwich_ingredient
  has_many :ingredients, :through => :sandwich_ingredient,
           after_add: :calcutale_calories

  def as_json options = {}
    super only: [:name, :bread_type, :total_calories],
          include: [ingredients: {
                        except: [
                          :created_at, :updated_at
                        ]
                    }]
  end

  def calcutale_calories ingredient
    #self.total_calories = self.ingredients.sum :calories
    self.total_calories += ingredient.calories
    self.save!
  end
end
