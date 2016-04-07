# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery-dataTables-min
#= require bootstrap
#= require bootstrap-datepicker
#= require_tree .
$(document).ready ->
  $('.orders').DataTable
    "bPaginate": true,
    "bLengthChange": false,
    "bFilter": true,
    "bInfo": false,
    "bAutoWidth": false
  $('.input-group.date').datepicker format: 'yyyy-mm-dd'
  return
$(document).on 'change', '.quantity', ->
  trContainer = $(this).closest('tr')
  quantity = parseInt($(this).val())
  productWeight = parseInt(trContainer.find('#product_weight').val())
  weightContainer = trContainer.find('.weight')
  weight = productWeight * quantity
  weightContainer.val weight
  orderPrice = trContainer.find('.price').val()
  orderAmountContainer = trContainer.find('.amount')
  amount = orderPrice * quantity
  orderAmountContainer.val amount
  productQuantity = parseInt(trContainer.find('#product_quantity').val())
  spanContainer = trContainer.find('td span')
  orderQuantity = parseInt(trContainer.find('td.order_quantity').text())
  balance = orderQuantity - quantity
  if trContainer.has('td.balance').length > 0
    trContainer.find('td.balance').html balance
  if productQuantity < quantity
    spanContainer.html '<p style=\'color:red\'>You are trying to order in excess to what we have in the inventory</p>'
  else
    spanContainer.html ''
  return