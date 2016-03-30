class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :display_order_items]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @products = Product.all
    @order_items = @order.order_items.present? ? @order.order_items : @order.order_items.build
  end

  # GET /orders/1/edit
  def edit
    order_items
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @products = Product.all
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, flash: { 'alert alert-success' => 'Order was successfully created.' }}
        format.json { render :show, status: :created, location: @order }
      else
        order_items
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def order_items
    @items = Array.new
    @products.each do |product|
      @items << OrderItem.new(product_id: product.id, price: product.price)
    end
    @order_items = (@order.order_items + @items).uniq(&:product_id)
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, flash: { 'alert alert-success' => 'Order was successfully updated.' } }
        format.json { render :show, status: :ok, location: @order }
      else
        order_items
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, flash: { 'alert alert-success' => 'Order was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  def display_order_items
    @delivery = @order.delivery || @order.build_delivery
    @invoice = @delivery.invoice || @delivery.build_invoice
    if @delivery.order_items.blank?
      @order.order_items.each do |order_item|
        @delivery.order_items << OrderItem.new(quantity: order_item.quantity, price: order_item.price, amount: order_item.amount, weight: order_item.weight, product_id: order_item.product_id)
      end
    end
    @delivery.order_items.each do |order_item|
      @invoice.order_items << OrderItem.new(quantity: order_item.quantity, price: order_item.price, amount: order_item.amount, weight: order_item.weight, product_id: order_item.product_id)
    end
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      @products = Product.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :customer_id, :date, order_items_attributes: [:id, :quantity, :price, :weight, :amount, :_destroy, :product_id, :order_id])
    end
end
