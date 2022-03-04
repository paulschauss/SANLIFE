ap "coucou"


groups = NutrientFood.all.group_by {|nf| [nf.food.name, nf.nutrient_id]}.values

groups.each do |group|
  ap group.size
  ap group.sort_by(&:measure_value)[1..].each(&:destroy)
end
