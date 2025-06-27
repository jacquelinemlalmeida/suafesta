# app/services/meal_calculation.rb
class MealCalculation
  attr_reader :adults, :children

  def initialize(adults:, children:)
    @adults = adults
    @children = children
  end

  def adult_food_quantity_grams
    adults * 250
  end

  def chield_food_quantity_grams
    children * 100
  end

  def adult_beverage_quantity_ml
    adults * 400
  end

  def chield_beverage_quantity_ml
    children * 200
  end

  def to_h
    {
      total_food_kg: ((adult_food_quantity_grams + chield_food_quantity_grams) / 1000.0).round(2),
      total_beverage_liters: ((adult_beverage_quantity_ml + chield_beverage_quantity_ml) / 1000.0).round(2),
      adult_food_quantity_grams: adult_food_quantity_grams,
      chield_food_quantity_grams: chield_food_quantity_grams,
      adult_beverage_quantity_ml: adult_beverage_quantity_ml,
      chield_beverage_quantity_ml: chield_beverage_quantity_ml,
    }
  end
end
