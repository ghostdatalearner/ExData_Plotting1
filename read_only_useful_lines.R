# Coursera JHU Spec Data Science
#
# Exploratory Data Analysis
#
# Project 1
#

# This function reads the useful rows and writes them to a temporary file
#
# The input file is ordered by date, so the algorithm is as follows
#
# Read the input file until you find the first row matching the pattern
# Flag that useful chunck has been found
# Continue until the pattern is not found

read_only_useful_lines <- function(fileNameInput,fileNameTemp,txtpattern)
{
  foundchunk <- 0
  conread=file(fileNameInput,open="r")
  conwrite=file(fileNameTemp,open="w")
  # Read the headerline
  input <- readLines(conread, n=1)
  # Write the header line
  writeLines(input, conwrite)
  while (length(input <- readLines(conread, n=1)) > 0)
    {
      if(length(grep(txtpattern,input))>0){
        writeLines(input, conwrite)
        if (foundchunk == 0)
        {
          foundchunk <- 1
        }
      }
      else if(foundchunk)
        break;
    } 
  close(conread)
  close(conwrite)
}