$(function(){
  window.addEventListener('message', function(event) {
    if(event.data.showhud == true){
      $('.huds').fadeIn();
    }
    if (event.data.action == "toggleCar"){
      if (event.data.show){
        $('.carStats').fadeIn();
        $('.other').fadeIn();

      } else{
        $('.carStats').fadeOut();
        $('.other').fadeOut();
      }
    } else if (event.data.action == "engineSwitch"){
      if(event.data.status){
        $('#engine').css('color','green');
      } else{
        $('#engine').css('color','red');
      }
    } else if (event.data.action == "lockSwitch"){
      if(event.data.status){
        $('#lock').css('color','green');
      } else {
        $('#lock').css('color','red');
      }
    } else if (event.data.action == "toggleAllHud"){
      toggleAllHud(event.data.status)
    } else if (event.data.action == "updateGas"){
      setProgressFuel(event.data.value,'.progress-fuel');
    } else if (event.data.action == "updateKM"){
      setProgressKM(event.data.value,'.progress-km');
    } else if (event.data.action == "setstreet") {
      document.getElementById('street').innerHTML = event.data.street;
    } else if (event.data.action == 'setkmh') {
      document.getElementById('kmh').innerHTML = event.data.kmh + "kmh";
    }
  });
});

function setProgressFuel(percent, element){

  document.getElementById('fueltext').innerHTML = percent + ".0 L";
}

function setProgressKM(km, element){

  document.getElementById('kmtext').innerHTML = km + " KM";
}