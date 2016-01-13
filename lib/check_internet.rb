#  credit for this http://stackoverflow.com/a/8317838
require 'open-uri'

def internet?
  begin
    true if open('http://www.google.com')
  rescue
    false
  end
end
