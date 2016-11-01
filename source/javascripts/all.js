// responsive menu
function responsive() {
  document.getElementsByClassName("navbar")[0].classList.toggle("responsive");
}

//function closeMenu() {
//  console.log(document.getElementById('menu'))
//  document.getElementById('menu').style.display = "none";
//}

function share() {
  FB.ui({
    method: 'share',
    mobile_iframe: true,
    href: 'http://new-taipei-activities.alanyeh20001.com'
  });
}

// display Google map
(function() {
  var places  = $(".map-link");

  $(places).click(function() {
    gmap_div = $(this).parent().find(".gmap");

    if (gmap_div.length > 0) {
      if (gmap_div.css("display") == "none") {
        gmap_div.css("display", "block");
      } else {
        gmap_div.css("display", "none");
      }
    } else {
      var address = $(this).attr("data-address"),
          src = "https://www.google.com/maps/embed/v1/place?key=AIzaSyAN0If1rokFAVvHS8D_TguBwoQOpWYfDbQ&q=" + address + "&language=zh-TW",
          map = "<div class='gmap' style='display:block;'><iframe width='90%' height='300' src=" + src + "></iframe></div>";

      $(this).parent().append(map);
    }
  })
})();
