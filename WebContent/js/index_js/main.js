/*----------------------------------------------------------------------------

        1.	Loader
        2.	Placeholder plugin
        3.	Clock Setup
        4.	Background Slider / Parallax
        5.	Validate Form
        6.	Modal Window
		7.	Rotator

/*----------------------------------------------------------------------------*/
jQuery(document).ready(function($) {
    'use strict';
/*----------------------------------------------------------------------------*/
/*	1.	Loader
/*----------------------------------------------------------------------------*/
$(window).load(function() {
    $("#preload-content").delay(300).fadeOut("400");
    $("#preload").delay(800).fadeOut("400");
});

/*----------------------------------------------------------------------------*/
/*	2.	Placeholder Plugin
/*----------------------------------------------------------------------------*/
    $('input, textarea').placeholder();

/*----------------------------------------------------------------------------*/
/*	3.	Clock Setup
/*----------------------------------------------------------------------------*/
    $('#clock').countdown('2019/06/12', function(event) {
        $(this).html(event.strftime(''
                + '<div class="clock-section"><span>%D</span> <p>days</p></div> '
                + '<div class="clock-section"><span>%H</span> <p>hours</p></div> '
                + '<div class="clock-section"><span>%M</span> <p>minutes</p></div> '
                + '<div class="clock-section"><span>%S</span> <p>seconds</p></div>'));
    });

/*----------------------------------------------------------------------------*/
/*	4.	Background Slider / Parallax
/*----------------------------------------------------------------------------*/	
	// Parallax
	var $scene = $('#scene');
	$scene.parallax();
	
/*----------------------------------------------------------------------------*/
/*	5.	Validate Fotm
/*----------------------------------------------------------------------------*/
    $('form#contactform').submit(function(e) {
		e.preventDefault();
        var action = $(this).attr('action');

        $("#contact-form-message").fadeIn("100", function() {
            $('#contact-form-message').hide();
			
            $.post(action, {
                name: $('#contact-name').val(),
                email: $('#contact-email').val(),
                comments: $('#contact-comments').val()
            },
				function(data) {
					$('#contact-form-message').html(data);
					$('#contact-form-message').fadeIn("100");
					console.log(data);
				}
            );
        });
        return false;
    });

/*----------------------------------------------------------------------------*/
/*	6.	Modal Window
/*----------------------------------------------------------------------------*/
    $('#modal-open').on('click', function(e) {
        var mainInner = $('#modal-window .container'),
                modal = $('#nav');

        mainInner.animate({opacity: 0}, 300, function() {
            $('html,body').scrollTop(0);
            modal.addClass('modal-active').fadeIn(600);
        });
        e.preventDefault();

        $('#modal-close').on('click', function(e) {
            modal.removeClass('modal-active').fadeOut(300, function() {
                mainInner.animate({opacity: 1}, 200);
            });
            e.preventDefault();
        });
    });
	
/*----------------------------------------------------------------------------*/
/*	7.	Rotating Title
/*----------------------------------------------------------------------------*/
	$("#rotate").rotator();
});

/*----------------------------------------------------------------------------*/
/*	9.	Sign in Modal Window
/*----------------------------------------------------------------------------*/
    $('#modal_sign_in').on('click', function(e) {
        var mainInner1 = $('#modal-window .container'),
                modal1 = $('#modal_custom_sign_in');

        mainInner1.animate({opacity: 0}, 300, function() {
            $('html,body').scrollTop(0);
            modal1.addClass('modal-active').fadeIn(600);
        });
        e.preventDefault();

        $('.modal_custom_custom-close').on('click', function(e) {
            modal1.removeClass('modal-active').fadeOut(300, function() {
                mainInner1.animate({opacity: 1}, 200);
            });
            e.preventDefault();
        });
    });
/*----------------------------------------------------------------------------*/
/*	10.Sign up Modal Window
/*----------------------------------------------------------------------------*/
    $('#modal_sign_up').on('click', function(e) {
        var mainInner2 = $('#modal-window .container'),
                modal2 = $('#modal_custom_sign_up');

        mainInner2.animate({opacity: 0}, 300, function() {
            $('html,body').scrollTop(0);
            modal2.addClass('modal-active').fadeIn(600);
        });
        e.preventDefault();

        $('.modal_custom_custom-close').on('click', function(e) {
            modal2.removeClass('modal-active').fadeOut(300, function() {
                mainInner2.animate({opacity: 1}, 200);
            });
            e.preventDefault();
        });
    });
/*----------------------------------------------------------------------------*/
/*	11.Reset PW Modal Window
/*----------------------------------------------------------------------------*/
    $('#modal_reset-pw').on('click', function(e) {
        var mainInner3 = $('#modal-window .container'),
                modal3 = $('#modal_custom_reset-pw');

        mainInner3.animate({opacity: 0}, 300, function() {
            $('html,body').scrollTop(0);
            modal3.addClass('modal-active').fadeIn(600);
        });
        e.preventDefault();

        $('.modal_custom_custom-close').on('click', function(e) {
            modal3.removeClass('modal-active').fadeOut(300, function() {
                mainInner3.animate({opacity: 1}, 200);
            });
            e.preventDefault();
        });
    });
