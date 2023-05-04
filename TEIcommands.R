library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)

poemList <- xml_find_all(doc, "//lg")
poemList
chapterList <- xml_find_all(doc, "//div")
chapterList
