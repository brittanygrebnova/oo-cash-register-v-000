class CashRegister
  require 'pry'
  
  attr_accessor :total, :discount, :title, :price, :items, :last_transaction_amount
  
  @@all = []
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
    
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      @items << title
    end
    @last_transaction_amount = price * quantity
  end
  
  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * (@discount.to_f / 100))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
    
  def items
    @items
  end
  
  def void_last_transaction
    @total -= @last_transaction_amount
  end
  
end
