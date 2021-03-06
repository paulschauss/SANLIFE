require "csv"

User.destroy_all
Illness.destroy_all
Food.destroy_all
Nutrient.destroy_all

puts "Data destroyed"

amine = User.create!(first_name: 'Amine', last_name: 'LAFI', email: 'amine@sanlife.me', password: '123456')
puts "Amine user created"

marie = User.create!(first_name: 'Marie', last_name: 'DELORI', email: 'marie@sanlife.me', password: '123456')
puts "Marie user created"

paul = User.create!(first_name: 'Paul', last_name: 'SCHAUSS', email: 'paul@localhost.me', password: '123456')
puts "Paul user created"

nutrient_data = {
  "Vitamin B12" => 'vitB12.csv',
  "Vitamin C" => 'vitC.csv',
  "Vitamin D" => 'vitD.csv',
  "Vitamin B6" => 'vitB6.csv',
  "Potassium" => 'potassium.csv',
  "Iron" => 'iron.csv',
  "Magnesium" => 'magnesium.csv',
  "Zinc" => 'zinc.csv',
  "Protein" => 'protein.csv',
  "Calcium" => 'calcium.csv',
  "Vitamin B9" => 'vitB9.csv',
  "Vitamin E" => 'vitE.csv'
}

nutrient_logo = {
  "Vitamin B12" => '009-eggs.png',
  "Vitamin C" => '010-orange.png',
  "Vitamin D" => '001-fish.png',
  "Vitamin B6" => '007-peas.png',
  "Potassium" => '011-broccoli.png',
  "Iron" => '003-spinach.png',
  "Magnesium" => '013-amande.png',
  "Zinc" => '006-meat.png',
  "Protein" => '005-chicken-leg.png',
  "Calcium" => '004-cheese.png',
  "Vitamin B9" => '002-cabbage.png',
  "Vitamin E" => '012-avocado.png'
}

puts "\n\n"



CSV.foreach("data_seed/illness_nutrients.csv", headers: :first_row, header_converters: :symbol) do |row|
  illness = Illness.find_or_create_by(name: row[:illness_name])
  nutrient = Nutrient.find_or_create_by(name: row[:nutrient_name], logo: nutrient_logo[row[:nutrient_name]])
  weight = row[:weight]

  p IllnessNutrient.create!(
    illness: illness,
    nutrient: nutrient,
    weight: weight
  )
end


nutrient_data.each do |name, file|
  puts "adding #{name} ..."
  nutrient = Nutrient.find_or_create_by(name: name, logo: nutrient_logo[name])

  CSV.foreach("data_seed/#{file}", headers: :first_row, header_converters: :symbol) do |row|
    food_name = row[:fooddescription].split(',').first
    food = Food.find_or_create_by(name: food_name)

    NutrientFood.create!(
      food: food,
      nutrient: nutrient,
      measure_value: row[:measurevalue]
    )
  end
end

p "Clean similar"

groups = NutrientFood.all.group_by {|nf| [nf.food.name, nf.nutrient_id]}.values

groups.each do |group|
  group.sort_by(&:measure_value)[1..].each(&:destroy)
end

p "Clean bad food"

bad_food = [
  "Butter",
  "Sausage",
  "Restaurant",
  "Frankfurter",
  "Onion rings",
  "Mushroom",
  "Sauce",
  "Bread",
  "Cookies",
  "Ketchup",
  "Sugars",
  "Salt",
  "Oil"
]

Food.where(name: bad_food).destroy_all
