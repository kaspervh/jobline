require 'watir'
require 'headless'
headless = Headless.new
headless.start

browser = Watir::Browser.new

# defalut array of jobnet job types
links = [
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Akademisk%2520arbejde", 
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Bygge%2520og%2520anl%25C3%25A6g",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Design,%2520formgivning%2520og%2520grafisk%2520arbejde",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Elever",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Hotel,%2520restauration,%2520k%25C3%25B8kken,%2520kantine%2520",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Industriel%2520produktion",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=It%2520og%2520teleteknik",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Jern,%2520metal%2520og%2520auto",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Kontor,%2520administration,%2520regnskab%2520og%2520finans",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Landbrug,%2520skovbrug,%2520gartneri,%2520fiskeri%2520og%2520dyrepleje%2520",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Ledelse",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Medie,%2520kultur,%2520turisme,%2520idr%25C3%25A6t%2520og%2520underholdning",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=N%25C3%25A6rings-%2520og%2520nydelsesmiddel",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=P%25C3%25A6dagogisk,%2520socialt%2520og%2520kirkeligt%2520arbejde",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Reng%25C3%25B8ring,%2520ejendomsservice%2520og%2520renovation",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Salg,%2520indk%25C3%25B8b%2520og%2520markedsf%25C3%25B8ring",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Sundhed,%2520omsorg%2520og%2520personlig%2520pleje",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Tekstil%2520og%2520bekl%25C3%25A6dning",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Transport,%2520post,%2520lager-%2520og%2520maskinf%25C3%25B8rerarbejde",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Tr%25C3%25A6,%2520m%25C3%25B8bel,%2520glas%2520og%2520keramik",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Undervisning%2520og%2520vejledning",
         "https://job.jobnet.dk/CV/FindWork?Offset=0&SortValue=BestMatch&OccupationAreas=Vagt,%2520sikkerhed%2520og%2520overv%25C3%25A5gning"
        ] 

# will loop through each link in the links array
links.each do |link|
  #will visit the url 
  browser.goto(link.to_s)

  # holds the name of the job type for later use
  job_type_name = browser.element(css: '.qualification-remove.ng-binding').text.strip
  puts job_type_name

  #holds the job ids
  job_ids = []

  # on the main page of the job type page the code will loop throug the list of available jobs
  #will sort away all the teaser text exept the id
  browser.ul(css: '.list-margin-standard').lis.each{|li| job_ids += li.text.strip.split("\n").select{|line| line.include?('Id:')}.map{|id| id.split(' ')[1..-1].join(' ')}}

  job_ids.each do |id|
    browser.goto("https://job.jobnet.dk/CV/FindWork/Details/#{id}")

    # skips if page is blank or if id is not recognized
    next if browser.url == 'https://job.jobnet.dk/CV/FindWork/JobNotFound'
    next if browser.element(css: '.well.white-well.ng-scope').text.strip == 'Der findes ingen annonce med dette ID-nummer.'

    # gets text for contact information
    info_box = browser.element(css: '.job-info-col.well.white-well.no-text-overflow.ng-scope').text.strip

    # skips if there is no email listed
    next if info_box.split("\n").select{|text| text if text && text.include?('Email:')}.first.nil?

    # setup variables for db injection
    main_text = browser.element(css: '.white-well').text.strip
    address = ''
    zip = ''
    phone = ''
    application_deadline = ''
    # grabs the emails from the info_box html element 
    email = info_box.split("\n").select{|text| text if text && text.include?('Email:')}.first.split(' ').last
    
    #loops through infobox string array with strings with nomber values in them and puts values into variables
    info_box.split("\n").map{ |info| info if info.count("0-9") > 0}.uniq.each_with_index do |text, i|
      address = text if i == 1
      zip = text.split(' ').first if i == 2
      phone = text.split(' ').last if text && text.include?("Hovednummer:")
      application_deadline = text.split(' ')[1..-1].join(' ') if text && text.include?('Ansøgningsfrist:')
    end
    
    # will pyt data into job posting db table
    JobPosting.where(job_type_id: JobType.find_by_name(job_type_name).id, main_text: main_text, address: address, zip: zip, phone: phone, email: email, application_deadline: application_deadline).first_or_create
  end
end



