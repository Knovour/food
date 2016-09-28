// pull in desired CSS/SASS files
require( './styles/main.pcss' );

// inject bundled Elm app into div#main
const Elm = require( '../elm/Main' );
Elm.Main.embed(document.getElementById('main'));
