$( document ).ready(function() {

    $('#slider_top').slick({
        dots: true,
        infinite: true,
        speed: 800,
        fade: true,
        cssEase: 'linear',
        arrows: false,
        autoplay: true,
        autoplaySpeed: 2000
    });

    $('#middle_slider').slick({
        dots: true,
        arrows: false,
        infinite: true,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3
                }
            },
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    //middle slider hover effect
    $('#middle_slider .slick-slide, #mid_goods_page .goods_cont').on('mouseenter', function () {
        $(this).children('.hidden_hover').fadeIn(500);
    });
    $('#middle_slider .slick-slide, #mid_goods_page .goods_cont').on('mouseleave', function () {
        $(this).children('.hidden_hover').fadeOut(500);
    });

    $('#burder').on('click', function(){
        var ul = $('#top .navigation');
        if( ul.is(":hidden") ){
            ul.slideDown( 600 );
        }else{
            ul.slideUp( 600 );
        }
    });

    //descr_buttons handler
    $('#descr_buttons .button_to').on('click', function (e){
        e.preventDefault();
        var content = $('#description_container .' + $(this).attr('href'));
        
        

        if ( content.is(':hidden') ){
            $(this).addClass('active').siblings().removeClass('active');
            content.siblings().css('display', 'none');
            content.fadeIn( 400 );
        }
    });

});
