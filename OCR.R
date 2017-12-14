library("pdftools", lib.loc="~/R/win-library/3.4")
library("tesseract", lib.loc="~/R/win-library/3.4")
dest <- "D:/Users/user/Dropbox/AIH Underwriting/SCOR/Askrindo/PDF"
myfiles <- list.files(path = dest, pattern = "pdf",  full.names = TRUE)
lapply(myfiles, function(i) system(paste('"C:/Program Files/Glyph & Cog/XpdfReader-win64/xpdf-tools-win-4.00/bin64/pdftotext.exe"', paste0('"', i, '"')), wait = FALSE) )
sapply(myfiles, FUN = function(i){
file.rename(from = i, to =  paste0(dirname(i), "/", gsub(" ", "", basename(i))))
})
myfiles <- list.files(path = dest, pattern = "pdf",  full.names = TRUE)
myfiles
lapply(myfiles, function(i){
# convert pdf to ppm (an image format), using
shell(shQuote(paste0("pdftoppm ", i, " -f 1 -l 2 -r 600 ocrbook")))
# convert ppm to tif ready for tesseract
shell(shQuote(paste0("convert *.ppm ", i, ".tif")))
# convert tif to text file
shell(shQuote(paste0("tesseract ", i, ".tif ", i, " -l eng")))
# delete tif file
file.remove(paste0(i, ".tif" ))
})
