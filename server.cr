require "http/server"

server = HTTP::Server.new(1234) do |s|
  s.response.print "Server running on port 1234"
end

server.listen
