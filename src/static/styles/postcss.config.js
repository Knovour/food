const path = require('path');

module.exports = {
	plugins: [
    require('postcss-smart-import'),
		require('postcss-cssnext')({
			browsers: [ 'last 1 versions' ]
		}),
		require('rucksack-css'),
		require('cssnano')({
			autoprefixer: false
		})
  ]
};
