library(RYandexTranslate)
ls("package:RYandexTranslate")
api_key="trnsl.1.1.20171204T084534Z.b0dcc4ac0f4a5cda.7a6724c79e0f4e00d7d6696e6de12c0e05a54af6"
directions <- get_translation_direction(api_key)
head(directions)
