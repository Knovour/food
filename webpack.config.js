const path              = require('path');
const webpack           = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

// detemine build env
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';

const postcssOpts = {
  loader: 'postcss-loader',
  options: {
    plugins: [
      require('postcss-import'),
      require('postcss-cssnext')({
        browsers: [ 'last 1 versions' ]
      }),
      require('postcss-nippon-color'),
      require('rucksack-css'),
      require('postcss-size'),
      require('cssnano')({
        autoprefixer: false
      })
    ]
  }
}

// common webpack config
const commonConfig = {
  output: {
    path: path.resolve(__dirname, './dist/'),
    filename: '[hash].js',
  },

  resolve: {
    extensions: [ '.js', '.elm' ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject:   'body',
      filename: 'index.html'
    })
  ]
}

// additional webpack settings for local env (when invoked by 'npm start')
if(TARGET_ENV === 'development') {
  module.exports = Object.assign({}, commonConfig, {
    entry: [
      'webpack-dev-server/client?http://localhost:7999',
      './src/static/index.js'
    ],
    devServer: {
      stats: {
        colors: true
      }
    },
    module: {
      rules: [{
        test:    /\.elm$/,
        exclude: [ /elm-stuff/, /node_modules/ ],
        use: [
          'elm-hot-loader',
          'elm-webpack-loader?verbose=true&warn=true&debug=true'
        ]
      }, {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
          postcssOpts
        ]
      }],
    }
  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if(TARGET_ENV === 'production') {
  module.exports = Object.assign({}, commonConfig, {
    entry: './src/static/index.js',
    module: {
      rules: [{
        test:    /\.elm$/,
        exclude: [ /elm-stuff/, /node_modules/ ],
        loader:  'elm-webpack-loader'
      }, {
        test: /\.p?css$/,
        loader: ExtractTextPlugin.extract({
          fallbackLoader: 'style-loader',
          use: [
            'css-loader',
            postcssOpts
          ]
        })
      }]
    },

    plugins: [
      new HtmlWebpackPlugin({
        template: 'src/static/index.html',
        inject:   'body',
        filename: 'index.html'
      }),
      new CopyWebpackPlugin([{
        from: 'src/static/favicon.png'
      }]),
      new ExtractTextPlugin({
        filename: './[hash].css',
        allChunks: true
      }),
      new webpack.optimize.UglifyJsPlugin({
        minimize: true,
        compressor: { warnings: false }
      })
    ]
  });
}
