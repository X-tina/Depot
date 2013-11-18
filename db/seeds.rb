# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#encoding: utf-8
Product.delete_all
Product.create(title: 'Azitsin tablets 0,5g. N 3', 
      description: %{<p> АЗИЦИН таблетки, вкриті оболонкою, по 500 мг № 3 </p>},
      image_url: 'http://www.apteka24.ua/data/products/big/145.0386.jpg', price: 43.9)

Product.create(title: 'Викасол 1% 1мл N 10', 
      description: %{<p> ВИКАСОЛ-ДАРНИЦЯ раствор для инъекций, 10 мг/мл по 1 мл в ампулах № 10 </p>},
      image_url: 'http://tabletki.ua/_assets/img/abc/large/Vikasol-darnica-10522.jpg', price: 14.2)

Product.create(title: 'Дарсил N 100', 
      description: %{<p> ДАРСИЛ Таблетки, в оболочке, по 22,5 мг № 10х10 в контурних упаковках в пачке </p>},
      image_url: 'http://www.apteka-kiev.com/drug_photos/small/bd-1450433.jpg', price: 36.5)