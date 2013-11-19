# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#encoding: utf-8
Product.delete_all

Product.create(title: 'Azitzin tablets 0.5mg', 
	description:  %{Azitzin coated tablets by 500 mg},
  	  image_url: 'http://www.apteka24.ua/data/products/big/145.0386.jpg', price: 43.9)



Product.create(title: 'Vikasol 1% 1ml ', 
      description: %{ Vikasol-Darnica injection, 10 mg/ml by 1 ml in ampoules },
      image_url: 'http://tabletki.ua/_assets/img/abc/large/Vikasol-darnica-10522.jpg', price: 14.2)

Product.create(title: 'Darsil 22.5mg', 
      description: %{<p> Darsil coated tablets, 22,5 mg  in outline packages in a pack </p>},
      image_url: 'http://www.apteka-kiev.com/drug_photos/small/bd-1450433.jpg', price: 36.5)