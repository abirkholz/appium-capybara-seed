class Utility
  # usage: @app.utility.name_of_method
  def check_url(actual_url, expected_url)
    return actual_url === expected_url
  end
end