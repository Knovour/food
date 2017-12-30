module.exports = {
	plugins: {
		'postcss-import': {},
		'postcss-cssnext': {
			browsers: [ 'last 1 versions' ]
		},
		'postcss-nippon-color': {},
		'rucksack-css': {},
		'postcss-size': {},
		'cssnano': {
			autoprefixer: false
		}
	}
}