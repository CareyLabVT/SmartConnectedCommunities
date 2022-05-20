function checkImage(url) {
  var request = new XMLHttpRequest();
  request.open("GET", url, true);
  request.send();
  request.onload = function() {
    status = request.status;
    if (request.status == 200) //if(statusText == OK)
    {
      document.getElementById("forecast").src = 'https://s3.flare-forecast.org/analysis/fcre/fcre-'+(new Date(new Date().getTime() - 24*60*60*1000)).toJSON().slice(0,10)+'-fcre_js2_turnover.png';
    } else {
      document.getElementById("forecast").src = 'https://s3.flare-forecast.org/analysis/fcre/fcre-'+(new Date(new Date().getTime() - 48*60*60*1000)).toJSON().slice(0,10)+'-fcre_js2_turnover.png';
    }
  }
}
checkImage('https://s3.flare-forecast.org/analysis/fcre/fcre-'+(new Date(new Date().getTime() - 24*60*60*1000)).toJSON().slice(0,10)+'-fcre_js2_turnover.png');
