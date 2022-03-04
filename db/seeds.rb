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


  CSV.foreach("data_seed/illness_nutrients.csv", headers: :first_row, header_converters: :symbol) do |row|
    illness = Illness.find_or_create_by(name: row[:illness_name])
    nutrient = Nutrient.find_or_create_by(name: row[:nutrient_name])

    p IllnessNutrient.create!(
      illness: illness,
      nutrient: nutrient
    )

  end

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
"Vitamin B9" => 'folate.csv',
"Vitamin E" => 'vitE.csv'
}

puts "\n\n"

nutrient_data.each do |name, file|
  puts "adding #{name} ..."
  nutrient = Nutrient.find_or_create_by(name: name)

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
