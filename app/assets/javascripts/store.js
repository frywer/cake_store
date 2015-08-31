

    'use strict';


/*$(function(){
//configuration
    var width = 875;
    var animationSpeed = 2000;
    var pause = 5000;
    var currentSlide = 1;

//cache DOM
    var $slider = $('#slider');
    var $slideContainer = $slider.find('.slides');
    var $slides = $slideContainer.find('.slide');

    var interval;
    function startSlider() {
        interval = setInterval(function () {
            $slideContainer.animate({'margin-left': '-='+width}, animationSpeed,
                function () {
                    currentSlide++;
                    if (currentSlide === $slides.length ) {
                        $slideContainer = pause;
                          currentSlide = 1;

                        $slideContainer.css('margin-left', 0);


                    }
                });
        },pause);
    }

    function stopSlider(){
        clearInterval(interval);
    }
    $slider.on('mouseenter', stopSlider).on('mouseleave', startSlider);

    startSlider()

});*/


    $(document).ready(function(){

        $('#ddmenu li').hover(function () {
            clearTimeout($.data(this,'timer'));
            $('ul',this).stop(true,true).slideDown(200);
        }, function () {
            $.data(this,'timer', setTimeout($.proxy(function() {
                $('ul',this).stop(true,true).slideUp(200);
            }, this), 100));
        });
    });




    $(document).ready(function(){
        $(".player").YTPlayer();
    });