# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
forums = ["Ruby and Rails", "Programlama Genel", "Genel Konular", "Tasarım", "Html&Css", "JQuery"]
forums.each do |forum|
  Forum.find_or_create_by(name: forum)
  puts "- #{forum} forumu oluşturuldu."
end
