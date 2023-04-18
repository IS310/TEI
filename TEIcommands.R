library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)
xml_find_all(doc, "//lg")

divs <- xml_find_all(doc, "//div")

xml_contents(divs)
xml_attr(divs, "id")


lg.v <- c()

for (div in divs) {
  print(xml_attr(div, "id"))
  print(xml_find_all(
    div, "//lg"
    )
  )
}

# Find verses from Chapter 24
xml_find_all(doc, '//TEI//text//body//div//div[27]//lg')

