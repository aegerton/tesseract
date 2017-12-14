library("pdftools", lib.loc="~/R/win-library/3.4")
library("tesseract", lib.loc="~/R/win-library/3.4")
## tesseract_download("ind")
## indonesia<- tesseract("indonesia")
cat(ocr("D:/Users/user/Dropbox/AIH Underwriting/SCOR/Askrindo/PDF/File 4-12-17, 8 06 27 PM.png", 
  engine =tesseract("ind")))
dest <- "D:/Users/user/Dropbox/AIH Underwriting/SCOR/Askrindo/PDF"
img_file <- pdf_convert("D:/Users/user/Dropbox/AIH Underwriting/SCOR/Askrindo/PDF/NOTAKESEPAHAMANSUMBERSEGARAPRIMADAYA.pdf", 
  format = 'tiff', pages = 1:2, dpi = 400)
text <- ocr(img_file, engine = tesseract("ind"))
unlink(img_file)
cat(text)
cat(text, file = "D:/Users/user/Dropbox/AIH Underwriting/SCOR/Askrindo/PDF/File 4-12-17, 8 06 27 PM.txt")
