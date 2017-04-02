// pull in desired CSS/SASS files
require('./styles/main.css');

// inject bundled Elm app into div#main
const Elm = require('../elm/Main');
Elm.Main.embed(document.getElementById('app'));
