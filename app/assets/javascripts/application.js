// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.slick

//= require_tree .

//      JOIN US TABS        //

$(document).ready(function() {
    $('.menu_button').click(function() {
        $('.menu_open').toggleClass('visible');
        $('.home').toggleClass('invisible');
    });

    $('#cadets-button').click(function() {
    var currentTab = $('.active-tab');
    var nextTab = $('#cadets');

    var currentButton = $('.active-button');
    var nextButton = $('#cadets-button');

    currentTab.fadeOut(600).removeClass('active-tab');
    nextTab.delay(600).fadeIn(600).addClass('active-tab');

    currentButton.removeClass('active-button');
    nextButton.addClass('active-button');

    document.getElementById("jumbotron").style.backgroundImage = "url('images/join.jpg')";
  });

  $('#staff-button').click(function() {
    var currentTab = $('.active-tab');
    var nextTab = $('#staff');

    var currentButton = $('.active-button');
    var nextButton = $('#staff-button');

    currentTab.fadeOut(600).removeClass('active-tab');
    nextTab.fadeIn(600).addClass('active-tab');

    currentButton.removeClass('active-button');
    nextButton.addClass('active-button');

    document.getElementById("jumbotron").style.backgroundImage = "url('images/staff.jpg')";
  });

  $('#committee-button').click(function() {
    var currentTab = $('.active-tab');
    var nextTab = $('#committee');

    var currentButton = $('.active-button');
    var nextButton = $('#committee-button');

    currentTab.fadeOut(600).removeClass('active-tab');
    nextTab.fadeIn(600).addClass('active-tab');

    currentButton.removeClass('active-button');
    nextButton.addClass('active-button');

    document.getElementById("jumbotron").style.backgroundImage = "url('images/committee.jpg')";
  });


    //      PORTAL BUTTONS CURRENTLY NOT USED       //
  /*  
  $('#activities-button').click(function() {
    var currentTab = $('.active-tab');
    var nextTab = $('.activities_section');

    var currentButton = $('.active-button');
    var nextButton = $('#activities-button');

    currentTab.fadeOut(600).removeClass('active-tab');
    nextTab.fadeIn(600).addClass('active-tab');

    currentButton.removeClass('active-button');
    nextButton.addClass('active-button');

    document.getElementById("jumbotron").style.backgroundImage = "url('images/join.jpg')";
  });

  $('#st-button').click(function() {
    var currentTab = $('.active-tab');
    var nextTab = $('.st_section');

    var currentButton = $('.active-button');
    var nextButton = $('#st-button');

    currentTab.fadeOut(600).removeClass('active-tab');
    nextTab.fadeIn(600).addClass('active-tab');

    currentButton.removeClass('active-button');
    nextButton.addClass('active-button');

    document.getElementById("jumbotron").style.backgroundImage = "url('images/join.jpg')";
  });

  $('#nt-button').click(function() {
    var currentTab = $('.active-tab');
    var nextTab = $('.nt_section');

    var currentButton = $('.active-button');
    var nextButton = $('#nt-button');

    currentTab.fadeOut(600).removeClass('active-tab');
    nextTab.fadeIn(600).addClass('active-tab');

    currentButton.removeClass('active-button');
    nextButton.addClass('active-button');

    document.getElementById("jumbotron").style.backgroundImage = "url('images/join.jpg')";
  });

  */

  $('.slider').slick({
    dots: true,
    arrows: false,
    appendDots: ".slider",
    autoplay: true,
    mobileFirst: true,
    speed: 1200
  });
  
});