require "./test/*"

require "http/server"

module Test
  def self.boot
    bind = "0.0.0.0"
    ENV["PORT"] ||= "8080"
    port = ENV["PORT"]

    server = HTTP::Server.new do |context|
      context.response.content_type = "text/plain"
      context.response << "Hello world, got #{context.request.path}"
    end

    puts "Listening on http://#{bind}:#{port}"
    server.listen(port.to_i)
  end
end

Test.boot
