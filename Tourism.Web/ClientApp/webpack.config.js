const CompressionWebpackPlugin = require('compression-webpack-plugin');
const webpackMerge = require('webpack-merge');
module.exports = (webpackinfo, angularinfo) => {
  var newdevserver = webpackMerge([
    webpackinfo,
    {
      plugins: [
        new CompressionWebpackPlugin()
      ]
    }]);
  return newdevserver;
};
