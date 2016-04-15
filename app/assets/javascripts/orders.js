$(document).ready(function(){
	$(".order_id").prop( "disabled", true );
	$(".customer_id").change(function(){
		var customerId = $(this).val();
		if(customerId == ""){
			$(".customer_address").val("");
			$(".customer_contact").val("");
			$(".order_id").empty();
			$(".order_id").prop( "disabled", true );
			alert("Please Select Customer");
		}
		else{
			$(".order_id").prop( "disabled", false );
			$.ajax({
				type: "GET",
				url: '/customers/' + customerId + '/customer_info'
			});
		}
	});
})