# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Morris.Line
    element: 'orders_chart'
    data: $('#orders_chart').data('orders')
    xkey: 'created_at'
    ykeys: ['balance']
    labels: ['price']