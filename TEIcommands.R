library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
doc %>% xml_find_all( '//*') %>% xml_path()

#  Find verses from the whole book
xml_find_all(doc, '//lg')

#  Find verses from the 7 Chapters that contain the verses
for (i in 1:42) {
  path <- paste('//TEI//text//body//div//div[', i, ']//lg', sep='')
  # print(path)
  d <- xml_find_all(doc, path)
  if (length(d) != 0) {
    print(d)
  }
}

