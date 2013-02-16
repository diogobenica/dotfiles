### load libraries

## add ls to all objects for listing methods
begin
  require 'looksee'
rescue LoadError => err
  warn "Couldn't load looksee: #{err}"
end

## for colored irb
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

## ap function for better printing
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}"
end

##  printing tables for active record
begin
  require 'hirb'
  Hirb.enable
  # tables and views
  extend Hirb::Console
rescue LoadError => err
  warn "Couldn't load Hirb: #{err}"
end



