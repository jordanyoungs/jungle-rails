class ReceiptMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt_email(order)
    @order = order
    @url = order_url(@order[:id])
    mail(to: @order.email, subject: "Jungle Order##{@order[:id]}")
  end
end
