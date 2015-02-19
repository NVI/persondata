remove_blanks <- function(v) {
  v <- gsub("^  ","",v)
  v <- gsub("^ ","",v)
  v <- gsub("  $","",v)
  v <- gsub(" $","",v)
}

df$name <- remove_blanks(df$name)
df$name_alt <- remove_blanks(df$name_alt)
df$desc_short <- remove_blanks(df$desc_short)
df$date_birth <- remove_blanks(df$date_birth)
df$place_birth <- remove_blanks(df$place_birth)
df$date_death <- remove_blanks(df$date_death)
df$place_death <- remove_blanks(df$place_death)
