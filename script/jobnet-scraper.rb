require 'watir'

browser = Watir::Browser.new

browser.goto('https://job.jobnet.dk/CV/FindWork/Details/5035220')

puts browser.element(css: '.white-well').text.strip
