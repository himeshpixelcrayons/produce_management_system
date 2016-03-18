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
	});
})