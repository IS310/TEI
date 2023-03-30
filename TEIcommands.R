library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
doc %>% xml_find_all( '//*') %>% xml_path()

xml_find_all(doc, '//lg')
xml_find_all(doc, '//TEI//text//body//div//div[27]//lg')
