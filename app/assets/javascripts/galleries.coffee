# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $(".bxslider").bxSlider( auto: true)




$(document).ready ->
  $(".product_image_content").hover \
    ( -> $(this).stop().animate(padding:"0px",200)),\
     (-> $(this).animate(padding:"10px", 200))


    #( -> $(this).children('img').stop().animate(margin:"0px", width:"280px",500)),\
     #(-> $(this).children('img').animate(margin:"10px",width:"220px", 200))









