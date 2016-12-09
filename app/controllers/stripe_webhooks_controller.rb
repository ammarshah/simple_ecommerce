class StripeWebhooksController < ApplicationController
  def charge_succeeded
  	data = params
    if data["type"].eql?("charge.succeeded")
      user_email = data["data"]["object"]["metadata"]["user_email"]
      order_id = data["data"]["object"]["metadata"]["order_id"]

      begin
        order = Order.find_by_id(order_id)
        order.date = Date.today
        order.save!
      rescue Exception => e
        puts "=========== Exception: charge_succeeded webhook: " + e.message
      end
    end

    render text: "Charge logged."
  end

  def charge_failed
  	
  end
end
