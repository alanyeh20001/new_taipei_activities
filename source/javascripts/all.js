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
