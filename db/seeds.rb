require "csv"

Illness.destroy_all
IllnessNutrient.destroy_all
NutrientFood.destroy_all
Nutrient.destroy_all
User.destroy_all

puts "Data destroyed"

amine = User.create!(first_name: 'Amine' last_name: 'LAFI' email: 'amine@sanlife.me', password: '123456')
puts "Amine user created"

marie = User.create!(first_name: 'Marie' last_name: 'DELORI' email: 'marie@sanlife.me', password: '123456')
puts "Marie user created"

paul = User.create!(first_name: 'Paul' last_name: 'SCHAUSS' email: 'paul@gsanlife.me', password: '123456')
puts "Paul user created"

illness_names = [
"Acne",
"Bloating",
"Concentration",
"Depression",
"Energy",
"Growth",
"Hair loss",
"Immunity",
"Insomnia",
"Pregnancy",
"Sport",
"Stress & Anxiety"
]

illness_names.each do |name|
  illness = Illness.create!(name: name)

  CSV.foreach("data_seed/illness_nutrients.csv", headers: :first_row, header_converters: :symbol) do |row|
    nutrient = Nutrient.find_or_create_by(name: row[:nutrient_name])

    IllnessNutrient.create!(
      illness: illness,
      nutrient: nutrient
    )
  end
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
"Folate" => 'folate.csv'
}

nutrient_data.each do |name, file|
  nutrient = Nutrient.create!(name: name)

  CSV.foreach("data_seed/#{file}", headers: :first_row, header_converters: :symbol) do |row|
    food = Food.find_or_create_by(name: row[:fooddescription])

    NutrientFood.create!(
      food: food,
      nutrient: nutrient,
      measure_value: row[:measurevalue]
    )
  end
end