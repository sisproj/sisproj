<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>

<style type="text/css">
#divClock{
	
}

#clock {
    height: 100px;
    line-height : 100px;
    width: 280px;
    position: relative;
    font-family: courier, monospace;
    text-align: center;
    color: white;
    font-size: 40px;
    margin: 0 auto;
    font-weight: 600;
}

#clockSection ul {
    height: 50px;
    width: auto;
    position: relative;
    text-align: center;
    margin: 0 auto;
}

#clockSection li {
    display: inline;
    margin-right: 15px;
    color: white;
    border: none;
    background: none;
    font-family: helvetica;
    text-transform: uppercase;
    font-size: 13px;
    padding-bottom: 3px;
    cursor: auto;
}

#clockSection li:not(.active):hover {
    color: #EDEDED;
    cursor: pointer;
}

#clockSection .active {
    border-bottom: solid white 1px;
    box-shadow: 1px 1px 5px transparent;
}
</style>
</head>
<body>

<div id="divClock">
    <div id="clock"></div>
    <ul>
        <li>Miami</li>
        <li>Los Angeles</li>
        <li class="active">Seoul</li>
        <li>Beijing</li>
        <li>Paris</li>
    </ul>
</div>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  -->
<script type="text/javascript">
$(document).ready(function () {

    function displayTime() {
        var currentTime = new Date();
        
        // Time difference between UTC and GTC
        var timeDifference = currentTime.getTimezoneOffset()/60;
        
        // Set hours to GTC ( UTC - time difference)
        var hours = currentTime.getHours() + timeDifference;
        
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();
        
        // This adds and substracts time from the GTC deppending on the active option
        if ($("#clockSection .active").text() === "Venezuela") {
            hours = hours - 4;
            if (minutes > 30) {
                minutes = minutes - 30;
            }
            else {
                hours = hours - 1;
                minutes = minutes + 30;
            }
            $("#divClock").css("background", "linear-gradient(to left, #FFE082, #FFCA28)");
        }
        if ($("#clockSection .active").text() === "Miami") {
            hours = hours - 5;
            $("#divClock").css("background", "linear-gradient(to left, #4CB8C4, #3CD3AD)");
        }
        if ($("#clockSection .active").text() === "Los Angeles") {
            hours = hours - 8;
            $("#divClock").css("background", "linear-gradient(to left, #90CAF9, #42A5F5)");
        }
          if ($("#clockSection .active").text() === "Seoul") {
            hours = hours + 9;
            $("#divClock").css("background", "linear-gradient(to left, #036, #069)");
        }
         if ($("#clockSection .active").text() === "Beijing") {
            hours = hours + 8;
            $("#divClock").css("background", "linear-gradient(to left, #FFAB91, #FF7043)");
        }
         if ($("#clockSection .active").text() === "Paris") {
            hours = hours + 1;
            $("#divClock").css("background", "linear-gradient(to left, #CE93D8 , #AB47BC)");
        }
        
        if (hours > 24) {
            hours = hours - 24;
        }
        
        if (hours < 0) {
            hours = hours + 24;
        }

        // Let's set the AM and PM meridiem and 
        // 12-hour format
        var meridiem = "AM"; // Default is AM
        
        // Convert from 24 hour to 12 hour format
        // and keep track of the meridiem.
        if (hours >= 12) {
            hours = hours - 12;
            meridiem = "PM";
        }

        // 0 AM and 0 PM should read as 12
        if (hours === 0) {
            hours = 12;
        }

        // If the seconds digit is less than ten                    
        if (seconds < 10) {
            // Add the "0" digit to the front
            // so 9 becomes "09"
            seconds = "0" + seconds;
        }
        // If the minute digit is less than ten                    
        if (minutes < 10) {
            // Add the "0" digit to the front
            // so 9 becomes "09"
            minutes = "0" + minutes;
        }
        // If the hour digit is less than ten                    
        if (hours < 10) {
            // Add the "0" digit to the front
            // so 9 becomes "09"
            hours = "0" + hours;
        }

        // This gets a "handle" to the clock div in our HTML
        var clockDiv = document.getElementById('clock');

        // Then we set the text inside the clock div
        // to the hours, minutes, and seconds of the current time
        clockDiv.innerText = hours + ":" + minutes + ":" + seconds + " " + meridiem;
    }
    
    // This Selects the button clicked and change its class to '.active'
    $("#clockSection li").click(function() {
        // Removes the active class form the other list items
        $("#clockSection li").removeClass("active");
        // Ads the active class to the clicked list item
        $(this).addClass("active");
    });

    // This runs the displayTime function the first time
    displayTime();

    // This makes our clock 'tick' by repeatedly
    // running the displayTime function every second.
    setInterval(displayTime, 500);
});
</script>
</body>
</html>