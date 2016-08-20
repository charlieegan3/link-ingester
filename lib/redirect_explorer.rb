class RedirectExplorer
  def explore(url)
    result = Curl::Easy.perform(url) do |curl|
      curl.head = true
      curl.follow_location = true
    end
    result.last_effective_url
  end
end
