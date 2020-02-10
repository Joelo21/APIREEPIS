const express = require("express");
const path = require('path');
const cookieParser = require('cookie-parser');
var logger = require('morgan');

const bodyParser=require('body-parser');
var AsignaturaCrud = require('./route/asignacionCrud');
var CriterioCrud = require('./route/criterioCrud');
var CursoCrud = require('./route/cursoCrud');
var EscuelaCrud = require('./route/escuelaCrud');
var IndicadorCrud = require('./route/indicadorCrud');
var MatriculaCrud = require('./route/matriculaCrud');
var NivelCrud = require('./route/nivelCrud');
var ObjetivoCrud = require('./route/objetivoECrud');
var PersonaCrud = require('./route/personaCrud');
var ResultadoCrud = require('./route/resultadoestudianteCrud');
var RubricaCrud = require('./route/rubricaCrud');

var app = express();
const cors=require("cors");
app.use(cors());

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/AsignaturaCrud',AsignaturaCrud);
app.use('/CriterioCrud',CriterioCrud);
app.use('/CursoCrud',CursoCrud);
app.use('/EscuelaCrud',EscuelaCrud);
app.use('/IndicadorCrud',IndicadorCrud);
app.use('/MatriculaCrud',MatriculaCrud);
app.use('/NivelCrud',NivelCrud);
app.use('/ObjetivoCrud',ObjetivoCrud);
app.use('/PersonaCrud',PersonaCrud);
app.use('/ResultadoCrud',ResultadoCrud);
app.use('/RubricaCrud',RubricaCrud);

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());
app.use(cookieParser());

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

  app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:4000');
    res.setHeader('Access-Control-Allow-Headers', 'Content-type,Authorization');
    next();
  });
  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
  
    // authorized headers for preflight requests
    // https://developer.mozilla.org/en-US/docs/Glossary/preflight_request
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
  
    app.options('*', (req, res) => {
        // allowed XHR methods  
        res.header('Access-Control-Allow-Methods', 'GET, PATCH, PUT, POST, DELETE, OPTIONS');
        res.send();
    });
  });

  module.exports = app;
