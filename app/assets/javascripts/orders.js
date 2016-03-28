$(document).ready(function(){
	$(".customer_id").change(function(){
		var customerId = $(this).val();
		if(customerId == ""){
			$(".customer_address").val("");
			$(".customer_contact").val("");
			$("#delivery_order_id").empty();
			alert("Please Select Customer");
		}
		else{
			$.ajax({
				type: "GET",
				url: '/customers/' + customerId + '/customer_info'
			});
		}
	});
})