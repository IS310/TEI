library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
doc %>% xml_find_all( '//*') %>% xml_path()

#  Find verses from the whole book
xml_find_all(doc, '//lg')

#  Find verses from Chapter 24
xml_find_all(doc, '//TEI//text//body//div//div[27]//lg')
