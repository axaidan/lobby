# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Reply.destroy_all
Post.destroy_all
UserCommitment.destroy_all
Commitment.destroy_all
User.destroy_all
Theme.destroy_all

count = 0
20.times do 
    count += 1
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(id: count, email: "#{(first_name + '.' + last_name).downcase}@yopmail.com", password: "nonono", first_name: first_name, last_name: last_name, department: (rand(1..95)).to_s, name_display: [true, false].sample)
end
User.create(id: 21, role: 'admin', email: "adminlobby@yopmail.com", password: "nonono", first_name: 'Amine', last_name: 'Admin', department: (rand(1..95)).to_s, name_display: [true, false].sample)

# COMMITMENTS SEED
Commitment.create(id: 1, title: "Je ne mange plus ni viande ni poisson", description: "Economie moyenne de 1,12 tCO2/an/pers")
Commitment.create(id: 2, title: "Je fais tous mes trajets urbains courts a velo", description: "Economie moyenne de 0.32 tCO2/an/pers")
Commitment.create(id: 3, title: "Je fais du covoiturage pour tous mes trajets moyens-longs", description: "Economie moyenne de 0.27 tCO2/an/pers")
Commitment.create(id: 4, title: "Je ne prends plus l'avion", description: "Economie moyenne de 0.22 tCO2/an/pers")
Commitment.create(id: 5, title: "Je n'achete plus de vetements neufs", description: "Economie moyenne de 0.17 tCO2/an/pers")
Commitment.create(id: 6, title: "Je ne mange que local", description: "Economie moyenne de 0.17 tCO2/an/pers")
Commitment.create(id: 7, title: "Je n'achete plus d'electromenager neuf", description: "Economie moyenne de 0.16 tCO2/an/pers")
Commitment.create(id: 8, title: "Je n'achete plus de hi-tech neuf", description: "Economie moyenne de 0.16 tCO2/an/pers")
Commitment.create(id: 9, title: "Je ne fais plus de dechet et suis equipe d'une gourde", description: "Economie moyenne de 0.09 tCO2/an/pers")
Commitment.create(id: 10, title: "J'installe des eclairages LEDs dans mon logement", description: "Economie moyenne de 0.02 tCO2/an/pers")

# THEMES SEED
count = 0
Theme.create(title: "Alimentation", description: "Ce Thème traite des problématiques d'Alimentation, via l'impact de l'industrie agroalimentaire sur l'environnement et sur notre santé.")
Theme.create(title: "Mobilité", description: "Ce Thème traite des problématiques de Mobilité, via l'impact des modes de transport sur l'environnement et sur notre santé.")
Theme.create(title: "Mode de vie", description: "Ce Thème traite des problématiques liées au Mode de Vie, via l'impact de la société de consommation sur l'environnement et nos vies quotidiennes.")
Theme.create(title: "Animaux", description: "Ce Thème traite des problématiques de la condition animale, et du traitement des animaux dans l'industrie.") 
Theme.create(title: "Habitat", description: "Ce Thème traite des problématiques liées à l'Habitat, et sur l'impact de la strucutre de nos logements sur l'environnement et notre santé.")
Theme.create(title: "Proximité", description: "Ce Thème traite des problématiques liées à la Proximité, et des possibilités de rapprocher les acteurs de l'économie géographiquement.")
Theme.create(title: "Hygiène", description: "Ce Thème traite des problématiques liées à nos comportements liés à l'Hygiène, et des possibilités d'améliorer leurs impacts sur l'environnement.")

count = 0
20.times do
    count += 1
    UserCommitment.create(id: count, user: User.find(rand(1..20)), commitment: Commitment.find(rand(1..10)))
end

count = 0
20.times do
    count += 1
    Post.create(id: count, user: User.find(rand(1..20)), title: Faker::Book.title, content: Faker::Quote.yoda)
end

count = 0
20.times do
    count += 1
    Reply.create(id: count, user: User.find(rand(1..20)), content: Faker::Quote.famous_last_words, post: Post.find(rand(1..20)))
end



puts 'SEEDS LOADED'
