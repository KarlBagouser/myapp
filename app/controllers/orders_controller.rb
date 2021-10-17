class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @output = []
    @orders = Order.where(user: current_user)
    @orders.each do |order|
      order_data = {id: order.id, amount: order.amount, items: []}
      order.items.each do |item|
        quantity = order.orders_descriptions.where(item: item)[0].quantity
        order_data[:items].push({id: item.id, name: item.name, price: item.price, quantity: quantity, sum: quantity * item.price})
      end
      @output.push(order_data)
    end
    @output
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if !params.key?("items")
      redirect_to items_path, status: 301
    else
      @items = Item.find(params[:items])
    end
  end
  

  def create
    amount = 0 
    items = params[:items]
    items.each do |item|
      cuurent_item = Item.find(item[:id])
      amount += cuurent_item.price * item[:quantity].to_i
    end
    @order = Order.create(user: current_user, amount: amount)
    items.each do |item|
      OrdersDescription.create(item_id: item[:id], order: @order, quantity: item[:quantity])
    end
    redirect_to root_path
  end
end
