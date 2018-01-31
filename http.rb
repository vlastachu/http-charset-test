require 'socket'
server = TCPServer.new('localhost', 2345)
loop do
  socket = server.accept
  request = socket.gets
  STDERR.puts request
  response = File.read('page.html')
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/html; charset=utf-8\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n\r\n"
  socket.print response
  socket.close
end