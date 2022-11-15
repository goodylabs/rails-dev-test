class OrdersService
  attr_reader :order

  def initialize(user_id)
    @user = User.find(user_id)
  end

  def create
    return if @user.nil?
    @order = Order.new(user_id: @user.id)
    @order.save
  end
end