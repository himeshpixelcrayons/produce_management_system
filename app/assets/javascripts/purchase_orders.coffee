$(document).ready ->
  $('.vendor_id').change ->
    vendorId = $(this).val()
    if vendorId == ''
      $('.purchase-order-items').empty()
      alert 'Please Select Customer'
    else
      $.ajax
        type: 'GET'
        url: '/vendors/' + vendorId
    return
  return