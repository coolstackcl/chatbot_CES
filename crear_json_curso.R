library(jsonlite)
library(dplyr)
curso = read_json("curso_base.json")

numero = c(1:8)
num_text = c("primero","segundo","tercero","cuarto","quinto","sexto","septimo","octavo")

mod_numero <- function(l, num, num_t, n_letra){
      l$value <- l$value %>% 
            gsub(pattern = "1", replacement = as.character(num)) %>% as.character() %>% 
            gsub(pattern = "A", replacement = LETTERS[n_letra]) %>% as.character()
      l$synonyms <- l$synonyms %>% 
            lapply(function(x) gsub(x, pattern = "1", replacement = as.character(num)) %>% as.character()) %>% 
            lapply(function(x) gsub(x, pattern = "primero", replacement = num_t[num]) %>% as.character()) %>% 
            lapply(function(x) gsub(x, pattern = "a$", replacement = letters[n_letra]) %>% as.character()) %>% 
            lapply(function(x) gsub(x, pattern = "A$", replacement = LETTERS[n_letra]) %>% as.character())
      return(l)
}

entries = list()
k=1
for (i in numero) {
      for (j in 1:3) {
            entries[[k]] <- mod_numero(curso$entries[[1]], 
                                       num = numero[i], 
                                       num_t = num_text,
                                       n_letra = j)
            k = k + 1
      }
}

entries[[k]] <-  list(value = "Kinder",
                         synonyms = list("kinder",
                                         "kindr",
                                         "KINDER"))

entries[[k+1]] <- list(value = "Pre-Kinder",
                       synonyms = list("PreKinder",
                                       "Pre Kinder",
                                       "PREKINDER",
                                       "prekinder",
                                       "pre.kinder"
                                       ))


curso_mod = curso

curso_mod$entries <- entries

write_json(curso_mod, "curso.json", auto_unbox = T)







