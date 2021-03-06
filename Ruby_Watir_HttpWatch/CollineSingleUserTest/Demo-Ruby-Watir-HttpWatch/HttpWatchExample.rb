require 'win32ole'
require "rubygems"
#require "watir"   #watir和watir-classic不能同时存在 
require "watir-classic"

# Open the IE browser using watir-classic
ie = Watir::IE.new

# Attach HttpWatch
control = WIN32OLE.new('HttpWatch.Controller')
plugin = control.IE.Attach(ie.ie)

#Clear the HttpWatch Log
plugin.Clear()

# Start recording
plugin.Record() 

#open page
ie.goto("http://www.runoob.com/")  

# Stop recording
plugin.Stop()

#Save an HttpWatch Log (.hwl) file
plugin.Log.Save('D:\\workspace\\Automation_PST\\Automation\\Ruby_Watir_HttpWatch\log\\mylogfile.hwl')

#Opening an HttpWatch Log File (.hwl)
# Open the log file and keep a reference to the returned Log object
log = control.OpenLog('D:\\workspace\\Automation_PST\\Automation\\Ruby_Watir_HttpWatch\\log\\mylogfile.hwl')
# Access the data in the log file using properties of the log object
printf "The log file contains %d entries\r\n", log.Entries.Count

#retrieve elapsed time
summary = log.Entries.Summary
puts summary.Time