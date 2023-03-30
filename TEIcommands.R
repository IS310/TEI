library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
v <- xml_find_all(doc, "//lg")

for (x in v) {
  print(x)
  print('is in')
  print(xml_attr(xml_parents(x)[2], "id"))
}

