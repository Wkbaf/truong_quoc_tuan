const { environment } = require('@rails/webpacker')
// resolving $ function is not found from view
const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  })
)
// END resolving
module.exports = environment