require "./test/*"

require "http/server"

module Test
  def self.boot
    bind = "0.0.0.0"
    ENV["PORT"] ||= "8080"
    port = ENV["PORT"]

    server = HTTP::Server.new(bind, port.to_i) do |context|
      context.response.content_type = "text/plain"
      context.response << "Hello world, got #{context.request.path}"
    end

    puts "Listening on http://#{bind}:#{port}"
    server.listen
  end
end

Test.boot
