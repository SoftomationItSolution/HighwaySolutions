
var express = require('express');
var app = express();
const cors = require('cors');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.use('/EventMedia', express.static('EventMedia/'));
let apiPrefix = '/Softomation/FastTrackHighway-TMS/'
app.use(apiPrefix, require('./_routers/commonRoute'));
app.use(apiPrefix, require('./_routers/userRoute'));
app.use(apiPrefix, require('./_routers/rolesRoute'));
app.use(apiPrefix, require('./_routers/manufactureRoute'));
app.use(apiPrefix, require('./_routers/systemIntegratorRoute'));
app.use(apiPrefix, require('./_routers/plazaRoute'));
app.use(apiPrefix, require('./_routers/vehicleClassRoute'));
app.use(apiPrefix, require('./_routers/tollFareRoute'));
app.use(apiPrefix, require('./_routers/laneRoute'));
app.use(apiPrefix, require('./_routers/transactionTypeRoute'));
app.use(apiPrefix, require('./_routers/paymentTypeRoute'));
app.use(apiPrefix, require('./_routers/exemptTypeRoute'));
app.use(apiPrefix, require('./_routers/equipmentRoute'));
app.use(apiPrefix, require('./_routers/floatProcessRoute'));
app.use(apiPrefix, require('./_routers/shiftRoute'));
let port = process.env.PORT || 5001;
app.listen(port, () => console.log('Server listening on port ' + port));