#!/usr/bin/env ruby

require './grabber'

grab_url, grab_path = ARGV[0], ARGV[1]

raise ArgumentError.new("You should set url for parsing") if grab_url.nil?
raise ArgumentError.new("You should set path for storing images") if grab_path.nil?

Grabber.get_images(grab_url, grab_path)
