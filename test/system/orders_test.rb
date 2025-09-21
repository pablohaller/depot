require "application_system_test_case"
class OrdersTest < ApplicationSystemTestCase
  include ActiveJob::TestHelper

  test "check order and delivery" do
      LineItem.delete_all
      Order.delete_all
      visit store_index_url
      click_on "Add to Cart", match: :first
      click_on "Checkout"
      fill_in "Name", with: "Dave Thomas"
      fill_in "Address", with: "123 Main Street"
      fill_in "Email", with: "dave@example.com"
      select "Check", from: "Pay type"
      fill_in "Routing number", with: "123456"
      fill_in "Account number", with: "987654"
      click_button "Place Order"
      assert_text "Thank you for your order"
      perform_enqueued_jobs
      assert_performed_jobs 1
      orders = Order.all
      assert_equal 1, orders.size
      order = orders.first
      assert_equal "Dave Thomas", order.name
      assert_equal "123 Main Street", order.address
      assert_equal "dave@example.com", order.email
      assert_equal "Check", order.pay_type
      assert_equal 1, order.line_items.size
    end
end
