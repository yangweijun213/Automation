#ref: http://rubyer.me/blog/1133/
require 'net/ssh'
require 'net/scp'

HOST = '172.20.20.90'
USER = 'test'
PASS = 'pst@1234'

Net::SSH.start( HOST, USER, :password => PASS ) do |ssh|
   result = ssh.exec!('ls')
   puts result
end