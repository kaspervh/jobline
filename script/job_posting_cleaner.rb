# heroku only allows 10 lines in any db table.
# since the job posting table runs each hour and fills up the db within 2 months.
# i need a piece of code that will delete any job posting that exedes the last application date


# loops through each job posting
JobPosting.all.each do |jp|
  #sanitises the danish date
  danish_date = jp.application_deadline.split(' ')
  day = danish_date[0].chomp('.')
  month = ''
  month = '01' if danish_date[1] == 'januar'
  month = '02' if danish_date[1] == 'febuar'
  month = '03' if danish_date[1] == 'marts'
  month = '04' if danish_date[1] == 'april'
  month = '05' if danish_date[1] == 'maj'
  month = '06' if danish_date[1] == 'juni'
  month = '07' if danish_date[1] == 'juli'
  month = '08' if danish_date[1] == 'august'
  month = '09' if danish_date[1] == 'september'
  month = '10' if danish_date[1] == 'oktober'
  month = '11' if danish_date[1] == 'november'
  month = '12' if danish_date[1] == 'december'
  year = danish_date[2]
  
  deadline = "#{year}-#{month}-#{day}".to_date
  
  # checks if the application deadline is 
  if deadline < Date.today
    jp.destroy
  end
  
end
puts JobPosting.all.count