require_relative '../sections/navigation'

class Solutions < SitePrism::Page
  section :navigation, Navigation, '.fusion-header'

  set_url('http://www.tapqa.com/solutions')
  set_url_matcher(/tapqa.com\/solutions\/?/)
end
