require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
 
  fixtures :priducts
 # Покупка товара. К концу теста заказ должен быть добавлен к таблице заказов orders, а товарная позиция - 
 # к line_items. поэтому сначала необходимо очистить эти таблицы
 test "buing a product" do
  LineItem.delete_all
  Order.delete_all
  medcine = products(:Darsil)
  
  # пользователь заходит на страницу каталога магазина
  get "/"
  assert_response :success
  assert_template "index"
  
  # Пользователь выбирает товар и добавляет его в корзину
  xml_http_request :post, '/line_items', product_id: medcine.id # т.к. при добавлении позиции в корзину использовалься Ajax-запрос
  # необходимо использ метод xml_http_request
  assert_response :success
  
  # проверка наличия в корзине запрошенного товара
  cart= Cart.find(session[:cart_id])
  assert_equal 1, cart.line_items.size
  assert_equal medcine, cart.line_items[0].product
  
  #Оформление заказа
  get "/orders/new"
  assert_response :success
  assert_template "new"
  
  # Данные отправлены и приложение создает заказ, переходит на страницу каталога
  # Тестовый метод post_via_redirect() генерирует post-запрос, затем следует любым возращаемым перенаправлениям, пока не будет возрващен ответ без перенапрвлекния
  post_via_redirect "/orders",
  					oreder: {name: "Dave Thomas",
  					address: "1-st Street",
  					email: "dave@example.com",
  					pay_type: "Check"}

  assert_response :success
  assert_template "index"
  cart = Cart.find(session[:cart_id])
  assert_equal 0, cart.line_items.size
  
  # Затем посмотрим в БД и убедимсся, что создан заказ и соответсвующа ятоварная позиция и что в них содерж верные данные
  # т.к. вначале мы очистили содержмое таблицы orders, сейчас достаточно проверить содержание в ней нового заказа
  orders = Order.all
  assert_equal 1, orders.size
  order = orders[0]

  assert_equal "Dave Thomas", order.name
  assert_equal "1-st Street", order.address
  assert_equal "dave@example.com", order.email
  assert_equal "Check", order.pay_type

  assert_equal 1, order.line_items.size
  line_item = order.line_items[0]
  assert_equal medcine, line_items.product

  # проверим, что почтовое отправление правильно адресовано и имеет ожидаемую строку темы
  mail = ActionMailer::Base.deliveries.last
  assert_equal ["dave@example.com"], mail.to
  assert_equal 'Depot <Depot@example.com>', mail[:from].value
  assert_equal "The order's confirmation", mail.subject
end
end
