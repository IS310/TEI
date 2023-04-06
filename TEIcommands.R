library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
xml_find_all(doc, "//lg")



