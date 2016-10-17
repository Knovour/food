const path              = require('path');
const webpack           = require('webpack');
const merge             = require('webpack-merge');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const Dashboard         = require('webpack-dashboard');
const DashboardPlugin   = require('webpack-dashboard/plugin');

console.log('WEBPACK GO!');

// detemine build env
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';

// common webpack config
const commonConfig = {
  output: {
    path:     'dist/',
    filename: '[hash].js',
  },

  resolve: {
    modulesDirectories: [ 'node_modules' ],
    extensions:         [ '', '.js', '.elm' ]
  },

  module: {
    noParse: /\.elm$/,
    loaders: [{
      test: /\.(eot|ttf|woff|woff2|svg)$/,
      loader: 'file-loader'
    }]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject:   'body',
      filename: 'index.html'
    })
  ],

  postcss(webpack) {
    return [
      require('postcss-import')({ addDependencyTo: webpack }),
      require('precss'),
      require('rucksack-css')
    ]
  }
}

// additional webpack settings for local env (when invoked by 'npm start')
if(TARGET_ENV === 'development') {
  console.log('Serving locally...');

  module.exports = merge(commonConfig, {
    entry: [
      'webpack-dev-server/client?http://localhost:7999',
      './src/static/index.js'
    ],

    devServer: {
      contentBase: "./src",
      hot: true,
      inline:   true,
      progress: true,
      noInfo: true,
      quiet: true,
      stats: {
        colors: true
      }
    },

    module: {
      loaders: [{
        test:    /\.elm$/,
        exclude: [ /elm-stuff/, /node_modules/ ],
        loader:  'elm-hot!elm-webpack?warn=true'
      }, {
        test: /\.p?css$/,
        loader: "style-loader!css-loader!postcss-loader"
      }]
    },
    plugins: [
      new DashboardPlugin(new Dashboard().setData)
    ]
  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if(TARGET_ENV === 'production') {
  console.log('Building for prod...');

  module.exports = merge(commonConfig, {
    entry: './src/static/index.js',
    module: {
      loaders: [{
        test:    /\.elm$/,
        exclude: [ /elm-stuff/, /node_modules/ ],
        loader:  'elm-webpack'
      }, {
        test: /\.p?css$/,
        loader: ExtractTextPlugin.extract('style-loader', [
          'css-loader',
          'postcss-loader',
        ])
      }]
    },

    plugins: [
      new CopyWebpackPlugin([{
        from: 'src/static/favicon.ico'
      }]),
      new webpack.optimize.OccurenceOrderPlugin(),
      new ExtractTextPlugin('./[hash].css', { allChunks: true }),
      new webpack.optimize.UglifyJsPlugin({
        minimize:   true,
        compressor: { warnings: false }
      })
    ]
  });
}
