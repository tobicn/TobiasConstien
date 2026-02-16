
---
title: 'Help! My Zoom transcript is full of junk!'
date: 2026-02-16
permalink: /posts/2026/02/blog-zoom-cleaner/
tags:
  - academic-gadgets
  - Zoom
  - qualitative research
  - interviews
  - R
---

Transcribing interviews has always been the worst part about doing qualitative research. So, of course, if Zoom tells me it will create a transcript automatically for me, I say yes instantly! Still, there's all this junk in the transcript Zoom produces that require further cleaning and formatting. I have done this cleaning and formatting of Zoom transcripts now across three separate research projects, but enough is enough: There needs to be a simpler solution. And there is. It's R.

Yes, of course, transcribing, the hard way, is a great way to really get to know your data, but at the same time, it also kind of makes you hate your data. And your voice. It's no fun. This is why I love Zoom transcripts. It minimizes the time I have to listen to my own voice. And yes, it does have its little hiccups, like not fully appreciating my German accent at times, but overall, it speeds up the transcription process immensely. 

Still, there's all this junk in the transcript Zoom produces that require further cleaning and formatting before the transcript is *actually* ready to be shared with participants (e.g., to check, add to, or approve), and to be analyzed. You can do this manually within your TextEdit, Word or even Excel. But maybe, this time could be spend actually getting to know your data rather than chasing empty lines and unnecessary clutter? **I got you!**


What's all this junk in my Zoom transcript?
----

Zoom's transcripts are meant to be used alongside their recorded video. That is why Zoom does not produce a simple text file, but instead saves the transcript as a VTT, or Video Text Track, file. This type of file is commonly used for subtitling of videos, which is basically what we do when we ask Zoom to produce a transcript. Consequently, the transcript does not only contain the text of all your thoughtful questions and your participants' insightful remarks, but also their corresponding number and time-stamps, which neatly map onto the video-recording from your interview.

![Example of a VTT File](images/VTT_Example.png)

While this may be a nice feature in case you ever plan to host a lovely interview watch-party, it may not really be helpful to you in your qualitative research pursuits, as the transcript (1) breaks up speech into separate lines, and (2) contains all this junk, namely time-stamps and numbering, that are not relevant to you. We want to know all the smart things our participants say. We don't really care at which hundreds of a second they say it. The following R code, therefore, removes all this junk, so that we can focus on what actually matters.

How do I clean my Zoom transcript using R
----

VTT files are basically just text files, which can be read into R as a character vector either using Base R commands (i.e., [readLines()](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/readLines)), or using the [*readr package*](https://readr.tidyverse.org/reference/read_lines.html) within the tidyverse. So, just like we would with any quantitative, we can load our qualitative data, i.e., the transcript downloaded from Zoom, into R.

    #load library
    library(readr)
    
    #read in transcript
    transcript <- read_lines(file.choose(),skip = 1, skip_empty_rows = TRUE)


Within this piece of code, we are already getting rid of some of the junk Zoom inserts into our transcripts, namely empty rows (i.e, `skip_empty_rows`), and the first line in the VTT file (i.e. `skip = 1`), which always starts with "WEBVTT". The junk remaining now are just the time-stamps, and the line numbers.

    transcript <- transcript[!grepl("^\\d+$", transcript) &  #remove lines that contain only numbers (e.g, 330)
                             !grepl("-->", transcript)]      #remove timestamp lines (e.g., 00:31:56.000 --> 00:31:58.360")


This code uses the `grepl()` function within R to get rid of (1) lines that contain only numbers, and (2) lines that contain time-stamps. The word *grepl* means “grep logical" and its function allows R to search for distinct patterns of characters within strings based on [regular expression syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Cheatsheet) (e.g., `\d` for numbers) or text input (e.g., `"-->"`)

These two lines of code already remove all of the junk Zoom inserts into our valuable qualitative data. However, Zoom also breaks interview responses into apart, to allow for subtitling line by line. This is unacceptable for us, who would like to read, and analyze our participants' responses in full, rather than separate chunks. So we'll need to take this one step further and merge consecutive lines from the same speaker.

    #merge consecutive lines
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

This code reads our transcript now line by line to (1) identify who is speaking and (2) if they are still speaking in the next line. If they do, then this code merges the two lines from the same speaker (if-part of the function). If they don't, this code adds the new line from the new speaker (else-part of the function). Ultimately, it produces a new transcript for us, our `cleaned transcript`.

One extra thing we might want to change in our transcript are our interviewer and participant names. Again, this can be done in R, with a basic "Find and Replace" function:

    #de-identify transcript
    transcript <- sub("Max Musterman", "Interviewer1", cleaned_transcript)   #replace Interviewer Name
    transcript <- sub("Erica Musterman", "Participant1", cleaned_transcript) #replace Participant Name
     

The only thing left to do is to save your cleaned transcript. We want to save it, like before, as a text file (e.g., .txt, .vtt) which can then be further imported into Word, NVivo, Excel, or just simply printed out. Again, we are using the *readr package* from the tidyverse for this.

    #save cleaned transcript
    write_lines(cleaned_transcript, "/transcript_cleaned.txt")


Can this be streamlined?
----

Yes! It can. Because most likely, you'll not only have just one transcript to deal with but, depending on your recruitment efforts, multiple! Rather than going through each step individually for each transcript, you may want to automate this cleaning process using a reusable function in R.

    clean_transcript <- function(file_path,
                             id_map = c("ZoomName" = "Interviewer1",
                                        "ZoomName" = "Participant1")) {
    
    #load transcript
    transcript <- readr::read_lines(file_path, skip = 1, skip_empty_rows = TRUE)
    
    #de-identify transcript
    for (original in names(id_map)) {
      transcript <- sub(original, id_map[original], transcript)
    }
    
    #remove clutter
    transcript <- transcript[!grepl("^\\d+$", transcript) & #remove lines that contain only numbers (e.g, 330)
                            !grepl("-->", transcript)]      #remove timestamp lines (e.g., 00:31:56.000 --> 00:31:58.360")
    
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
    cleaned_transcript <- c(cleaned_transcript, current_line)
    
    return(cleaned_transcript)
    }

The function can then be called upon using the following command:

    #using file.choose()
    cleaned_transcript <- clean_transcript(file.choose(),
                                           id_map = c("Max" = "Interviewer1",
                                                      "Erica" = "Participant1"))
    #specifying file path
    path <- "/transcript1.vtt"
    cleaned_transcript <- clean_transcript(path,
                                           id_map = c("Max" = "Interviewer1",
                                                      "Erica" = "Participant1"))

That's all.

You can download the full script via my GitHub page here. I haven't tested this yet with interviews or focus groups with more than two participants, though technically, if slightly adapted (i.e., `id_map`) the code should work just fine. Of course, there might be a hiccup, if the Zoom Name, which is included in the transcript, contains a colon, however, in those instances, the names can be deidentified prior to merging the lines. 

Is this useful to you? What else should be added? <i>[Let me know!](mailto:tobias.constien@ucdconnect.ie)</i>
