const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const TerserPlugin = require("terser-webpack-plugin")
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin")

// detemine build env
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development'

const commonConfig = {
  mode: TARGET_ENV,
  output: {
    path: path.resolve(__dirname, './dist/'),
    filename: '[hash].js',
  },

  resolve: {
    extensions: ['.js', '.elm']
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject:   'body',
    })
  ]
}

if(TARGET_ENV === 'development') {
  module.exports = Object.assign({}, commonConfig, {
    entry: [
      'webpack-dev-server/client?http://localhost:7999',
      './src/static/index.js'
    ],
    devServer: {
      stats: {
        colors: true,
        historyApiFallback: true
      }
    },
    module: {
      rules: [{
        test:    /\.elm$/,
        exclude: [ /elm-stuff/, /node_modules/ ],
        use: [
          'elm-hot-webpack-loader',
          'elm-webpack-loader?verbose=true&debug=true'
        ]
      }, {
        test: /\.css$/,
        use: [
          'style-loader',
          { loader: 'css-loader', options: { importLoaders: 1 }},
          'postcss-loader'
        ]
      }],
    }
  })
}

if(TARGET_ENV === 'production') {
  module.exports = Object.assign({}, commonConfig, {
    entry: './src/static/index.js',
    module: {
      rules: [{
        test: /\.elm$/,
				exclude: [/elm-stuff/, /node_modules/],
				use: {
					loader: 'elm-webpack-loader',
					options: { optimize: true }
				}
      }, {
        test: /\.p?css$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: { publicPath: '' }
          },
          { loader: 'css-loader', options: { importLoaders: 1 }},
          'postcss-loader'
        ]
      }]
    },

    plugins: [
			new CleanWebpackPlugin({
				verbose: true,
			}),
      new HtmlWebpackPlugin({
        template: 'src/static/index.html',
        inject: 'body',
      }),
      new CopyWebpackPlugin([{
        from: 'src/static/favicon.png'
      }]),
      new MiniCssExtractPlugin({
        filename: './[hash].css',
        allChunks: true
      })
    ],
    optimization: {
      minimizer: [
				new TerserPlugin({ exclude: 'elm', sourceMap: true, parallel: true }),
        new OptimizeCSSAssetsPlugin({})
      ]
    }
  })
}
