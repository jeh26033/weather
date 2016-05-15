require 'rubygems'
require 'nokogiri'
require "weather/version"
require 'open-uri'
#require "sun.rb"

module Weather
	class ZipGrabber
		def initialize; end

			puts "Welcome"
		puts "Enter your ZIP code"
		answer= STDIN.gets.chomp
		if answer.length == 5 
			puts "one moment please"
			answer
			puts answer
		else
			puts "Not a valid code"	

		end

	page = Nokogiri::HTML(open( "https://www.wunderground.com/cgi-bin/findweather/getForecast?query=#{answer}" )) 
	info = page.css('#content-wrap').css('#inner-wrap').css('#city-page').css('#current').css('#cc1').text
	info.gsub!(/\n{2+,}/, "\n")
	info.gsub!(/(\r\n){2+,}/, "\r\n")	
	puts info

		end 
		
end


