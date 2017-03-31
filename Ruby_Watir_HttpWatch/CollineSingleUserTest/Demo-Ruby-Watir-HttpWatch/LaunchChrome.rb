#-------------------------------------------------------------# 
# Demo test for the Watir controller. 
# Ruby23
# Use Chrome browser. 
#-------------------------------------------------------------# 

require 'rubygems'    
require 'watir'  #watir和watir-classic不能同时存在 

chrome = Watir::Browser.new :chrome #方式1  
#chrome = Watir::Browser.new  #方式2
chrome.goto("http://www.runoob.com/")
chrome.close  