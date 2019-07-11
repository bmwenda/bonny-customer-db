class ApiVersion
  attr_reader :version, :default

  def initialize(version, default = false)
    @version = version
    @default = default
  end

  def matches?(request)
    accept_header = request.headers[:accept]
    accept_header.include?("application/vnd.cust-db.#{version}+json") || default
  end
end
