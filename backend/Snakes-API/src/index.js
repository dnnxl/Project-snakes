const express = require('express');
const app = express();

//Settings> Configuración del puerto, entorno de desarrollo, nombre de la app, motor de plantilla.
 app.set('port',process.env.PORT || 3000);

// Middleware> Func que se ejecutan antes de procesar algo.
app.use(express.json());

//Routes> URLs
app.use(require('./routes/specialist'));
app.use(require('./routes/images'));
app.use(require('./routes/logbook'));
app.use(require('./routes/principalinformation'));
app.use(require('./routes/sighting'));
app.use(require('./routes/sightingbyanswer'));
//Starting server
app.listen(app.get('port'), () => {
    console.log('Server on port ',app.get('port'));
});