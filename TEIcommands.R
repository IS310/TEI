library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
xml_find_all(doc, "//head")
list <- xml_find_all(doc, "//lg")
for (i in list)
  return(head)


xml_structure(doc)