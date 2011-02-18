require 'rexml/document'
path_dir = 'C:/Ruby/Projects/sms_xml_to_txt/lib'
# get the XML data as a string
xml_data = File.open(path_dir + '/input/input.xml'){ |file| file.read }

# extract event information
doc = REXML::Document.new(xml_data)
res_str = ""
str_from_to = ""

doc.elements.each("data/sms") { |element|
  addr = element.attributes["address"]
  
  if addr == ""
    str_from_to = "<< OWNER ; "
  else
    str_from_to = ">> " + addr + " ; "
  end
  res_str = res_str + str_from_to + element.attributes["human_readable_date"]+ " ; " + element.attributes["body"] + " ;\n\n" }

File.open(path_dir + '/output/output.txt', 'w'){ |file| file.write res_str }
