# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(cat_name: "Food",
                tax_fee: nil,
                fee_free: true)

Category.create(cat_name: "Medicals",
                tax_fee: nil,
                fee_free: true)

Category.create(cat_name: "Books",
                tax_fee: nil,
                fee_free: true)

Category.create(cat_name: "Others",
                tax_fee: 10,
                fee_free: false)
