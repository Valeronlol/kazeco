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

    //our_projects sliders

    $('.art_slider, .news_slider').slick({
        dots: true,
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        speed: 400,
        arrows: false,
        autoplay: true,
        autoplaySpeed: 3000,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 560,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
    $('.proj_slider').slick({
        dots: true,
        slidesToShow: 2,
        slidesToScroll: 1,
        infinite: true,
        speed: 400,
        arrows: false,
        autoplay: true,
        autoplaySpeed: 3000,
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
        ]
    });

    //callback
    $('.callback').on('click', function (e) {
        e.preventDefault();
        $('#callback_us').fadeIn( 600 );
    });
    $('#callback_close').on('click', function () {
        $('#callback_us').fadeOut( 600 );
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

//Google Maps API

function initMap() {
    var customMapType = new google.maps.StyledMapType([{
        "featureType": "all",
        "elementType": "all",
        "stylers": [{
            "hue": "#ff003b"
        }]
    }, {
        "featureType": "all",
        "elementType": "geometry",
        "stylers": [{
            "hue": "#00e1ff"
        }]
    }, {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [{
            "hue": "#FFBB00"
        }, {
            "saturation": 43.400000000000006
        }, {
            "lightness": 37.599999999999994
        }, {
            "gamma": 1
        }]
    }, {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [{
            "hue": "#00FF6A"
        }, {
            "saturation": -1.0989010989011234
        }, {
            "lightness": 11.200000000000017
        }, {
            "gamma": 1
        }]
    }, {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [{
            "hue": "#FFC200"
        }, {
            "saturation": -61.8
        }, {
            "lightness": 45.599999999999994
        }, {
            "gamma": 1
        }]
    }, {
        "featureType": "road.arterial",
        "elementType": "all",
        "stylers": [{
            "hue": "#FF0300"
        }, {
            "saturation": -100
        }, {
            "lightness": 51.19999999999999
        }, {
            "gamma": 1
        }]
    }, {
        "featureType": "road.local",
        "elementType": "all",
        "stylers": [{
            "hue": "#FF0300"
        }, {
            "saturation": -100
        }, {
            "lightness": 52
        }, {
            "gamma": 1
        }]
    }, {
        "featureType": "water",
        "elementType": "all",
        "stylers": [{
            "hue": "#0078FF"
        }, {
            "saturation": -13.200000000000003
        }, {
            "lightness": 2.4000000000000057
        }, {
            "gamma": 1
        }]
    }], {
        name: 'ValCust'
    });
    var customMapTypeId = 'custom_style';
    var myLatLng = { lat: 42.754432, lng: 75.005250 }; // РљРѕРѕСЂРґРёРЅР°С‚С‹ .
    var image = '../icon_map.png'; // Marker Icon
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: myLatLng,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
        }
    });

    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image
    });

    map.mapTypes.set(customMapTypeId, customMapType);
    map.setMapTypeId(customMapTypeId);
}