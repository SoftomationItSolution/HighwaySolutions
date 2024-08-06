function restartSystem() {
    controlSystem('/restart');
}

function shutdownSystem() {
    controlSystem('/shutdown');
}

function controlSystem(endpoint) {
    document.getElementById('loader').style.display = 'block';
    
    fetch(endpoint, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        }
    }).then(response => {
        if (response.ok) {
            checkReconnection();
        } else {
            alert('Failed to perform the action.');
            document.getElementById('loader').style.display = 'none';
        }
    }).catch(error => {
        alert('Error: ' + error);
        document.getElementById('loader').style.display = 'none';
    });
}

function checkReconnection() {
    setTimeout(function() {
        fetch('/')
            .then(response => {
                if (response.ok) {
                    document.getElementById('loader').style.display = 'none';
                    alert('Action completed successfully!');
                } else {
                    checkReconnection();
                }
            })
            .catch(error => {
                checkReconnection();
            });
    }, 5000); // Check every 5 seconds
}