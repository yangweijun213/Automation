#ref: http://rubyer.me/blog/1133/

require 'net/ssh'
require 'net/scp'

HOST = '172.20.20.90'
USER = 'test'
PASS = 'pst@1234'

Net::SCP.start( HOST, USER, :password => PASS ) do |scp|
   scp.upload!( 'd:/server_test.log', '/home/test/' )
   scp.download!( '/home/test/zt.csv', 'd:/' )
end