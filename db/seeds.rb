# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(id: 1) do |admin|
  admin.email: ENV['ADMIN_EMAIL'] ,
  admin.password: ENV['ADMIN_PASSWORD'])
end

Genre.create([
    { name: '初めての〇〇' },
    { name: 'やらかし' },
    { name: '〇〇回記念'},
    ])