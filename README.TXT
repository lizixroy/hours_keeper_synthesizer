I use Hours Keeper iOS app(https://itunes.apple.com/us/app/hours-keeper-pro-time-tracking/id559701364?mt=8) a lot when doing my remote job
I need my hours to be orgnized by day, however, working hours tend to be cut into pieces. So I wrote this Ruby script to assemble them into per-day format.

e.g.
August 31 - 2.0
August 28 - 1.3
August 27 - 2.17
August 26 - 2.18
August 25 - 1.85
August 21 - 3.35
total hours is 12.85

# You need to export your hours in CSV format to your desktop and extract dates line and hours line(using spresheet processor like Excel or Numbers) into separate files called dates.txt & hours.txt and put them in the same directory in which this script is placed. Then run the script.
