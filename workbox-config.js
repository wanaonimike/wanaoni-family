module.exports = {
  globDirectory: "dist",
  globPatterns: ["**/*.{html,js,css,png,jpg,json}"],
  swDest: "dist/sw.js",
  navigateFallback: "/wanaoni-family/index.html",
  modifyURLPrefix: {
    "": "/wanaoni-family/"
  }
};
