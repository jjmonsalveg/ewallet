class ApiVersion
  attr_reader :version, :default

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    default || check_accept_headers(req.headers)
  end

  private

  def check_accept_headers(headers)
    headers['Accept']&.include?("application/vnd.ewallet.v#{version}+json")
  end
end
