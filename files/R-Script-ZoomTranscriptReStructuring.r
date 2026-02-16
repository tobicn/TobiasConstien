#Zoom Transcript Cleaner (Vers. 20260216)
#Tobias Constien, https://tobicn.github.io/TobiasConstien/

#install and load library
install.packages("readr")
library(readr)

#Step-by-step process ----

##load Zoom transcript ----
transcript <- read_lines(file.choose(), skip = 1, skip_empty_rows = TRUE) #skip = 1 removes first row "WEBVTT"

##de-identify transcript ----
transcript <- sub("Erica", "Interviewer1", transcript)    #replace Interviewer Name
transcript <- sub("Max", "Participant1", transcript)      #replace Participant Name

##remove clutter ----
transcript <- transcript[!grepl("^\\d+$", transcript) &  #remove lines that contain only numbers (e.g, 330)
                         !grepl("-->", transcript)]      #remove timestamp lines (e.g., 00:31:56.000 --> 00:31:58.360")

##merge consecutive lines ----
cleaned_transcript <- c()
current_line <- transcript[1]

for (i in 2:length(transcript)) {
  
  #extract speaker label (everything before colon)
  prev_speaker <- sub(":.*", "", current_line)
  this_speaker <- sub(":.*", "", transcript[i])
  
  if (prev_speaker == this_speaker) {
    #remove speaker label from new line and append text
    text_only <- sub("^[^:]+:\\s*", "", transcript[i])
    current_line <- paste(current_line, text_only)
  }
  else {
    cleaned_transcript <- c(cleaned_transcript, current_line)
    current_line <- transcript[i]
  }
}

cleaned_transcript <- c(cleaned_transcript, current_line) #add last line

##save cleaned transcript ----
write_lines(cleaned_transcript, "/transcript_clean.txt")

#Re-usable function ----
clean_transcript <- function(file_path,
                             id_map = c("ZoomName" = "Interviewer1",
                                        "ZoomName" = "Participant1")) {
 
  # Load transcript (skip WEBVTT header + empty rows)
  transcript <- readr::read_lines(file_path, skip = 1, skip_empty_rows = TRUE) #skip = 1 removes first row "WEBVTT"
  
  #de-identify transcript
  for (original in names(id_map)) {
    transcript <- sub(original, id_map[original], transcript)
  }
  
  #remove clutter
  transcript <- transcript[!grepl("^\\d+$", transcript) & #remove lines that contain only numbers (e.g, 330)
                           !grepl("-->", transcript)]     #remove timestamp lines (e.g., 00:31:56.000 --> 00:31:58.360")
  
  #merge consecutive lines
  cleaned_transcript <- c()
  current_line <- transcript[1]
  for (i in 2:length(transcript)) {
    prev_speaker <- sub(":.*", "", current_line)
    this_speaker <- sub(":.*", "", transcript[i])
    if (prev_speaker == this_speaker) {
      text_only <- sub("^[^:]+:\\s*", "", transcript[i])
      current_line <- paste(current_line, text_only)
    } else {
      cleaned_transcript <- c(cleaned_transcript, current_line)
      current_line <- transcript[i]
    }
  }
  cleaned_transcript <- c(cleaned_transcript, current_line) #add last line
  
  return(cleaned_transcript)
}

cleaned_transcript <- clean_transcript(file.choose(),
                                       id_map = c("Max" = "Interviewer1",
                                                  "Erica" = "Participant1"))
