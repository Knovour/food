// pull in desired CSS/SASS files
require('./styles/main.css');

// inject bundled Elm app into div#app
const { Elm } = require('../elm/Main');
Elm.Main.init({ node: document.getElementById('app') });
