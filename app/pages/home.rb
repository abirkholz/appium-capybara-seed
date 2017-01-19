require_relative '../sections/navigation'

class Home < SitePrism::Page
  section :navigation, Navigation, '.fusion-header'

  set_url('http://www.tapqa.com')
  set_url_matcher(/tapqa.com\/?/)
end
