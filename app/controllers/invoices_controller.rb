class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @order_items = @invoice.order_items.present? ? @invoice.order_items : @invoice.order_items.build
    @orders = []
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, flash: { 'alert alert-success' => 'Invoice was successfully created.' }}
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, flash: { 'alert alert-success' => 'Invoice was successfully updated.' }}
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, flash: { 'alert alert-success' => 'Invoice was successfully destroyed.' }}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
      @delivery = @invoice.delivery
      @order = @delivery.order
      @orders = (@order.customer.undelivered_orders << @order).uniq
      @order_items = OrderItem.where("(orderable_id = ? AND orderable_type = 'Order') OR (orderable_id = ? AND orderable_type = 'Delivery') OR (orderable_id = ? AND orderable_type = 'Invoice')", @order.id, @delivery.id, @invoice.id).group_by(&:product_id)   
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:delivery_id, :date, order_items_attributes: [:id, :quantity, :price, :weight, :amount, :_destroy, :product_id, :order_quantity])
    end
end
