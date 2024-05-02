var socket = io.connect('http://' + document.domain + ':' + location.port);
socket.on('new_data', function (data) {
    let mydata = data.data;
    var lcontainer = document.getElementById("left_data_display");
    var rcontainer = document.getElementById("right_data_display");
    lcontainer.innerHTML = "";
    rcontainer.innerHTML = "";
    let dl = parseInt(mydata.length / 2)
    for (var i = 0; i < mydata.length; i++) {
        var div = document.createElement("div");
        if (mydata[i] == "1")
            div.className = "box green";
        else
            div.className = "box red";

        div.textContent = i + 1;
        if (i > dl)
            rcontainer.appendChild(div);
        else
            lcontainer.appendChild(div);
    }
});

function showHideFields() {
    var tcpFields = document.getElementById("tcpFields");
    var serialFields = document.getElementById("serialFields");
    var tcpRadio = document.getElementById("tcp");
    if (tcpRadio.checked) {
        tcpFields.style.display = "block";
        serialFields.style.display = "none";
    } else {
        tcpFields.style.display = "none";
        serialFields.style.display = "block";
    }
}