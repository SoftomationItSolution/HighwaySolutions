//var socket = io.connect('http://' + document.domain + ':' + location.port, { reconnection: true });
var socket = io.connect('http://' + document.domain + ':' + location.port);

socket.on('connect', function () {
    console.log('Connected to server');
});

socket.on('message', function (data) {
    if (data.aline_data != null) {
        display_aligment(data.aline_data)
    }
    if (data.event_data != null) {
        update_event(data.event_data)
    }
});

socket.on('disconnect', function () {
    console.log('Disconnected from server');
});

socket.on('error', function (err) {
    console.error('Socket.IO error:', err);
});


function display_aligment(mydata) {
    console.log(mydata)
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
}

function update_event(data) {
    const img = document.getElementById("base64Image");
    img.src = data.AvcImage;

    const AvcClassName = document.getElementById("AvcClassName");
    AvcClassName.innerHTML = data.AvcClassName;

    const AvcClassAxcel = document.getElementById("AvcClassAxcel");
    AvcClassAxcel.innerHTML = "Axle-" + data.AxleCount;

    const dt = document.getElementById("dt");
    dt.innerHTML = data.SystemDateTime;
}


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