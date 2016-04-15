class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
    @order_items = @delivery.order_items.present? ? @delivery.order_items : @delivery.order_items.build
    @orders = []
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)
    if params[:delivery][:order_id].present?
      @order = Order.find(params[:delivery][:order_id])
      @orders = (@order.customer.undelivered_orders << @order).uniq
    end
    if params[:customer_id].present?
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.undelivered_orders
    end
    @delivery.save
    @errors = @delivery.errors.full_messages
    respond_to do |format|
      if @errors.blank?
        format.html { redirect_to deliveries_path, flash: { 'alert alert-success' => 'Delivery was successfully created.' } }
        format.json { render :show, status: :created, location: @delivery }
      else
        @orders = []
        format.html { render :new }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    @delivery.update(delivery_params)
    @errors = @delivery.errors.full_messages
    respond_to do |format|
      if @errors.blank?
        format.html { redirect_to deliveries_path, flash: { 'alert alert-success' => 'Delivery was successfully updated.'} }
        format.json { render :show, status: :ok, location: @delivery }
      else
        format.html { render :edit }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url, flash: { 'alert alert-success' => 'Delivery was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
      @order = @delivery.order
      @orders = (@order.customer.undelivered_orders << @order).uniq
      @order_items = OrderItem.where("(orderable_id = ? AND orderable_type = 'Order') OR (orderable_id = ? AND orderable_type = 'Delivery')", @order.id, @delivery.id).group_by(&:product_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:order_id, :date_delivered, :payment_type, order_items_attributes: [:id, :quantity, :price, :weight, :amount, :_destroy, :product_id, :order_quantity])
    end

    def order_items_params
      params.require(:order_items_attributes).permit!
    end
end
