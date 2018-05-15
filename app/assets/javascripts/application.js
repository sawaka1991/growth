// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree .
//= require jquery_nested_form

//ハンバーガー！
$(function(){
    $(".menu").click(function(){
        $(".menu1").toggleClass("menuclick1")
    });
    $(".menu").click(function(){
        $(".menu2").toggleClass("menuclick2")
    });
    $(".menu").click(function(){
        $(".menu3").toggleClass("menuclick3")
    }); 
});
// メニューを開いた時
jQuery(function($){
      $('.menu').click(function(){
         if ($('#menu').css('display') == 'none') {
          $('#menu').slideDown('fast');
        } else {
           $('#menu').slideUp('fast');
         }
      });
        });


$(function(){
    //最初は全てのパネルを非表示に
    $('#material > dd').hide();
    $('#material > dt')
      .click(function(e){
   //選択したパネルを開く
        $('+dd', this).slideToggle(800);
      })
});


$(function(){
    //最初は全てのパネルを非表示に
    $('#history > dd').hide();
    $('#history > dt')
      .click(function(e){
   //選択したパネルを開く
        $('+dd', this).slideToggle(500);
      })
});

$(function(){
    //最初は全てのパネルを非表示に
    $('#concept > dd').hide();
    $('#concept > dt')
      .click(function(e){
   //選択したパネルを開く
        $('+dd', this).slideToggle(500);
      })
});


$(function(){
   $(".thumbnail").on('mouseover touchend',function(){
     var dataUrl = $(this).attr('data-url');
     $("#main-image").attr('src',dataUrl);
   });
});

$(function(){
 $('.thumbnails img').click(function(){
  var $thisImg = $(this).attr('src');
  var $thisAlt = $(this).attr('alt');
  $('.mainImage img').attr({src:$thisImg,alt:$thisAlt});
 });
});


$(document).ready(function(){
  $(".wrap").click(function(){
$(".side").toggleClass("triggered");
    $(".sidebtn").toggleClass("sideopacity");
  });
});




jQuery(function ($) {
    // セレクトボックスが変更されたら処理をする
    $('#pref-select').change(function () {
    
        // 選択した値を取得
        var select_val = $('#pref-select option:selected').val();
        
        // tbodyのtr数回 処理をする
        $.each($("#pref-table tbody tr"), function (index, element) {
        
            // 選択した値が空欄だったら、全ての行を表示する為の処理
            if (select_val == "") {
                $(element).css("display", "table-row");
                return true; // 次のtrへ
            }
            
            // 1行をテキストとして取り出し、セレクトボックスで選択した値があるかをチェック
            var row_text = $(element).text();
            
            if (row_text.indexOf(select_val) != -1) {
                // 見つかった場合は表示する
                $(element).css("display", "table-row");
            } else {
                // 見つからなかった場合は非表示に
                $(element).css("display", "none");
            }

        });
    });
});