class RedirectExplorer
  def explore(url)
    begin
      result = Curl::Easy.perform(url) do |curl|
        curl.head = true
        curl.follow_location = true
        curl.connect_timeout_ms = 2000
      end
      return result.last_effective_url
    rescue
      return url
    end
  end
end
