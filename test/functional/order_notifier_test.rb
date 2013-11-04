require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "recieved" do
    mail = OrderNotifier.recieved(orders(:one))
    assert_equal "The order's confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["Depot@example.com"], mail.from
    assert_match /1 x Darsil N 100/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "The order was shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["Depot@example.com"], mail.from
    assert_match /<td>1&times <\/td> Darsil N 100/, mail.body.encoded
  end

end
