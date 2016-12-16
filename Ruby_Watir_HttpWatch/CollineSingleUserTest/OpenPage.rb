require 'rubygems'    
require 'watir-classic'  #watir和watir-classic不能同时存在 

#加载默认路径引入公共类
require File.dirname(__FILE__) + '/ConfigureClass'
require File.dirname(__FILE__) + '/DateTimeClass'

#define transaction name
transactionName = "OpenPage"

# Open the IE browser using Watir
ie = Watir::IE.new 

# Attach HttpWatch
control = WIN32OLE.new('HttpWatch.Controller')
plugin = control.IE.Attach(ie.ie)

#Clear the HttpWatch Log
plugin.Clear()

# Start recording
plugin.Record() 

# Open page
ie.goto("#$url") 

#Checking for text in a page
puts ie.text.include?("Login")

# Stop recording
plugin.Stop()

#Exports a specified list of data fields in CSV (Comma-Separated Values) format 
plugin.Log.ExportFieldsAsCSV("#$httpWatchLogFolder\\#{transactionName}_#{DateTimeClass.new().getTimeStamp()}.csv","#$fieldList")





