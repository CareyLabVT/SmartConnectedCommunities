function setImage(num_days) { //Look for the latest graph URL
  var request = new XMLHttpRequest();
  var url = 'https://s3.flare-forecast.org/analysis/fcre/fcre-'+(new Date(new Date().getTime() - num_days*24*60*60*1000)).toJSON().slice(0,10)+'-fcre_js2_turnover.png'
  request.open("GET", url, true);
  request.send();
  request.onload = function() {
    status = request.status;
    if (request.status == 200) //if(statusText == OK)
    {
      document.getElementById("forecast").src = url;
    } else {
      setImage(num_days + 1) //Look for the graph URL for the previous day
    }
  }
}
setImage(0);
