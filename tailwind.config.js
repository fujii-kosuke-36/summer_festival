module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        robo: ['Cherry Bomb One', 'cursive']
      }
    }
  },  
  plugins: [
    require("daisyui"),
  ],
}
