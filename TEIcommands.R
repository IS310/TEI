library(xml2)
doc <- read_xml("JaneEyre.tei")
xml_ns_strip(doc)

verses <- xml_find_all(doc, "//lg")

# We use xml children to get all of the children on the same level as the chapters
body.v <- xml_children(xml_children(xml_children(doc)[2])[1])[10]

# Chapter 1 starts at 5, so we get all children 5:5+38
chapters.v <- xml_children(body.v)[5:43]

print(chapters.v)

verse.chapters <- c() # chapter numbers containing verses
i <- 1 # We start at chapter 1

# We try to loop through every chapter to check each chapter for the 
# existence of a <lg> tag, and print the chapter number if we do

for (chapter in chapters.v) {
  # The issue with the previous expression was the diff between ".//lg" and "//lg"
  # "//lg searches the entire document, where as .//lg searching beneath the current node
  
  if (length(xml_find_all(chapter, ".//lg")) > 0) {
    print(i)
    append(verse.chapters, i)
  }
  i <- i + 1
}





