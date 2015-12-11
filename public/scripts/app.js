$(document).ready(function() {

// var addBuck = document.querySelector("#addBuck");
//
// addBuck.addEventListener("click", function() {
//   $("#addBuck").append("<img>");
//   $("img").prop("src", "http://i.imgur.com/uNotNJN.png");
// });
var counter = 0;
var addBuck = document.querySelector("#buckbutton");
addBuck.addEventListener("click", function() {
  counter += 1;
  $("#thebuckit").append("<img id=" + counter + ">");
  $("#" + counter).prop("src", "http://i.imgur.com/uNotNJN.png");
  $("#" + counter).css({
    position: 'absolute',
    top:  getRandomIntegerRange(400,525) + 'px',
    left: getRandomIntegerRange(36,56) + '%',
    width: '70px',
    height: '100px'
    // top: $("#" + counter).position().top - getRandomIntegerRange(0,100),
    // left: $("#" + counter).position().left + getRandomIntegerRange(0,500)
  });
});



});


function getRandomIntegerRange(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}
