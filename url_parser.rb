class UrlParser
  def initialize(url)
    @url = url
end

  def scheme
  @url.split(':')[0]
  end

  def domain
    @url.split('/')[2]
  end

  def port
      if @url.include? "https"
        return "443"
      else
        return "80"
      end
    end

  def path
    @url.split('/')[3].split('?')[0]
  end

  def query_string
    query = @url.split("?")[1].split("#")[0].split(/[=&]/)
    Hash[*query]
  end


  def fragment_id
  @url.split('#')[1]
  end
end


github_url = UrlParser.new "https://github.com/search?q=ruby#stuff"


p github_url.scheme

p github_url.domain

p github_url.port

p github_url.path

p github_url.query_string
# => {"q" => "ruby"}
p github_url.fragment_id
