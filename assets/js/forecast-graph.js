document.getElementById("forecast").src='https://s3.flare-forecast.org/analysis/fcre/fcre-'+(new Date(new Date().getTime() - 48*60*60*1000)).toJSON().slice(0,10)+'-fcre_js2_turnover.png';
