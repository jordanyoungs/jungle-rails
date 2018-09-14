class ReceiptPreview < ActionMailer::Preview
  def order_1_receipt
    ReceiptMailer.order_receipt_email(Order.first)
  end

  def most_recent_order_receipt
    ReceiptMailer.order_receipt_email(Order.last)
  end
end
