$(document).ready(function(){
	$(".quantity").change(function(){
		var trContainer = $(this).closest('tr');
		var quantity = parseInt($(this).val());

		var productWeight = parseInt(trContainer.find("#product_weight").val());
		var orderWeightContainer = trContainer.find('.order_order_items_weight input');
		var orderWeight = productWeight * quantity;
		orderWeightContainer.val(orderWeight);

		var orderPrice = trContainer.find('.order_order_items_price input').val();
		var orderAmountContainer = trContainer.find('.order_order_items_amount input');
		var amount = orderPrice * quantity
		orderAmountContainer.val(amount)

		var productQuantity = parseInt(trContainer.find("#product_quantity").val());
		var spanContainer = trContainer.find('td span');
		if(productQuantity < quantity){
			spanContainer.html("<p style='color:red'>You are trying to order in excess to what we have in the inventory</p>")
		}
	});

	$("#order_customer_id").change(function(){
		var customerId = $(this).val();
		if(customerId == ""){
			$(".customer_address").val("");
			$(".customer_contact").val("")
			alert("Please Select Customer");
		}
		else{
			$.ajax({
				type: "GET",
				url: '/customers/' + customerId + '/customer_info'
			});
		}
	});
	$('.input-group.date').datepicker({
	  format: 'yyyy-mm-dd'
	});

})