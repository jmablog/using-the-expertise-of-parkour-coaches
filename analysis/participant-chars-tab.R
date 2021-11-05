## ---- participant-chars-table

participants_tab <- readr::read_csv(here::here("data",
                                               "participants",
                                               "participant-characteristics.csv")) %>%
  separate(interview_length, into = c("H", "M", "S"), sep = ":") %>%
  mutate(across(H:S, ~ paste0(.x,cur_column()))) %>%
  unite(interview_length, H:S, sep = "") %>%
  mutate(interview_length_s = lubridate::duration(interview_length), .after = interview_length)


participants_tab_clean <- participants_tab %>%
  select(part_id, gender, country, age, parkour_experience_years, coaching_experience_years) %>%
  rename(`ID` = part_id,
         `Age (y)` = age,
         Gender = gender,
         Country = country,
         `Parkour` = parkour_experience_years,
         `Coaching` = coaching_experience_years)

participants_tab_cap <- "Participant characteristics."
participants_tab_scap <- "Participant characteristics"

if(pdf | git) {
  participants_tab_clean %>%
    kableExtra::kbl(caption = participants_tab_cap,
        caption.short = participants_tab_scap,
        booktabs = TRUE) %>%
    kableExtra::kable_styling(full_width = TRUE) %>%
    add_header_above(c(" " = 4, "Experience (y)" = 2)) %>%
    column_spec(1, width = "1cm") %>%
    column_spec(3, width = "3cm")
} else if(word) {
  participants_tab_clean %>%
    knitr::kable(caption = participants_tab_cap,
          caption.short = participants_tab_scap,
          booktabs = TRUE)
} else {
  participants_tab_clean
}
