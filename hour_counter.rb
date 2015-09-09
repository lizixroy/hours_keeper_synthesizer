# I use Hours Keeper iOS app(https://itunes.apple.com/us/app/hours-keeper-pro-time-tracking/id559701364?mt=8) a lot when doing my remote job
# However, working hours tend to be cut into pieces, but I need my hours to be orgnized by day. So I wrote this Ruby script assembles them into per-day format.

# e.g.
# August 31 - 2.0
# August 28 - 1.3
# August 27 - 2.17
# August 26 - 2.18
# August 25 - 1.85
# August 21 - 3.35
# total hours is 12.85

## You need to export your hours in CSV format to your desktop and extract dates line and hours line(using spresheet processor like Excel or Numbers) into separate files called dates.txt & hours.txt and put them in the same directory in which this script is placed. Then run the script. 

# Roy Li
# 6/9/2015

begin
  date_file = File.open("dates.txt", "r")
  f = File.open("hours.txt", "r")
rescue
  abort "Some(hours.txt or dates.txt) of the files do not exists"  
end

# get dates
dates = []
date_file.each_line do |line|  
  comma_index = line.index ','
  date_str = line[0, comma_index]
  dates << date_str  
end
dates

# get total hours
total_hours = 0
hours = []
f.each_line do |line|
  h_index = line.index 'h'
  h_number = line[0, h_index - 0]    
  m_end_index = line.index 'm'
  m_start_index = h_index + 2
  m_number = line[m_start_index, m_end_index - m_start_index]  
  hour = h_number.to_f + m_number.to_f / 60
  hour = hour.round(2)
  hours << hour
  total_hours += hour
end

index = 0
current_date = ""
previous_date = ""
current_hour = 0

while index < hours.count + 1 do
  date = dates[index]
  hour = hours[index]
  if date != current_date
    unless index == 0
      puts "#{current_date} - #{current_hour.round(2)}"
    end        
    current_date = date
    current_hour = hour
  else
    current_hour += hour
  end  
  index = index + 1
end

total_hours.round(2)

puts "total hours is #{total_hours.round(2)}"