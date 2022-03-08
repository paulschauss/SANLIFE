
    #         "Soy milk" => 1,
    #      "Almond milk" => 2,
    #           "Butter" => 3,
    #             "Eggs" => 4,
    #           "Turkey" => 5,
    #          "Sausage" => 6,
    #             "Milk" => 7,
    #       "Restaurant" => 8,
    #           "Cheese" => 9,
    #             "Beef" => 10,
    #             "Fish" => 11,
    #          "Chicken" => 12,
    #           "Yogurt" => 13,
    #      "Frankfurter" => 14,
    #      "Grape juice" => 15,
    #     "Orange juice" => 16,
    #  "Cranberry juice" => 17,
    # "Grapefruit juice" => 18,
    #     "Tomato juice" => 19,
    #      "Apple juice" => 20,
    #           "Tomato" => 21,
    #          "Spinach" => 22,
    #          "Bananas" => 23,
    #           "Garlic" => 24,
    #           "Onions" => 25,
    #         "Broccoli" => 26,
    #     "Strawberries" => 27,
    #          "Lettuce" => 28,
    #          "Oranges" => 29,
    #            "Pears" => 30,
    #           "Melons" => 31,
    #             "Figs" => 32,
    #          "Carrots" => 33,
    #           "Olives" => 34,
    #       "Nectarines" => 35,
    #        "Kiwifruit" => 36,
    #          "Mustard" => 37,
    #             "Kale" => 38,
    #            "Seeds" => 39,
    #          "Peaches" => 40,
    #          "Pickles" => 41,
    #      "Onion rings" => 42,
    #             "Nuts" => 43,
    #         "Tomatoes" => 44,
    #           "Hummus" => 45,
    #         "Mushroom" => 46,
    #        "Mushrooms" => 47,
    #              "Egg" => 48,
    #            "Flour" => 49,
    #           "Apples" => 50,
    #            "Sauce" => 51,
    #            "Bread" => 52,
    #          "Cookies" => 53,
    #    "Peanut butter" => 54,
    #             "Pork" => 55,
    #          "Ketchup" => 56,
    #            "Beans" => 57,
    #              "Ham" => 58,
    #           "Sugars" => 59,
    #             "Salt" => 60,
    #              "Oil" => 61


names = [
  "Vitamin D",
  "Zinc",
  "Calcium",
  "Magnesium",
]

nutrients = Nutrient.where(name: names)

food_ids = Food.where(name: ["Lettuce"]).pluck(:id)


data = FoodByNutrientService.call(nutrients, food_ids)

ap data
