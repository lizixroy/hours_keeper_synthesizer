# Working hours tend to be cut into pieces, this Ruby script assembles them into per-day format.
# Roy Li

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