# ABOUT: When the app class is instantiated, it instantiates the pages.
# This way, we can use a single instance of each page throughout the app.
# For example: @app.pagename.action

require_relative './helpers/utility'
require_relative './pages/home'
require_relative './pages/solutions'

class App
  def utility
    Utility.new
  end

  def home
    Home.new
  end

  def solutions
    Solutions.new
  end
end
