$(document).ready ->
  $('.order_id').change ->
    orderId = $(this).val()
    if orderId == ''
      $('.order-items').html ''
      alert 'Please select order first.'
    else
      $.ajax
        type: 'GET'
        url: '/orders/' + orderId + '/display_order_items'
    return
  return