#!/usr/bin/env bash

# a book cataloging script using a big switch/options statement

PS3="Select an option: "
options=("Add Book" "Delete Book" "View Books" "Quit")

select opt in "${options[@]}"; do
  case $opt in
    "Add Book")
      echo "--You selected Add Book--" 
      # if our database (books.txt file) doesn't exist, create it
      if [ ! -f "books.txt" ]; then
        touch "books.txt"
      fi
      # input prompts for book title and author
      read -p "Enter title: " title
      echo $title
      read -p "Enter author: " author
      echo $author
      # add book to our text file
      echo "$title by $author" >> books.txt
      echo "$title by $author added."
      ;;
    "Delete Book")
      echo "--You selected Delete Book--"
      # check to see if our text file exists, like before
      if [ ! -f "books.txt" ]; then
        echo "No books listed."
      else echo "Delete which book?"
           # if it exists, output its contents
           cat "books.txt"
           # enter the title we want to delete and save it to $deletedTitle
           read -p "Enter title: " deletedTitle
           # using grep to see if the title is listed in the file 
           if grep "$deletedTitle" "books.txt"; then
             #if it is, use sed to delete the whole line containing the title
             sed -i "" "/$deletedTitle/d" ./books.txt
             echo "$deletedTitle removed"
             #if the title isn't in our file, say ""Book not found""
           elif ! grep -q "$deletedTitle" "books.txt"; then
             echo "Book not found."
           fi
      fi
      ;;
    "View Books")
      echo "--You selected View Books--"
      # Once again, check if the books.txt file exists
      if [ ! -f "books.txt" ]; then
        echo "No books listed."
        #if it does, output its contents
      else cat "books.txt"; 
      fi
      ;;
    "Quit")
      # option 4 just quits the program
      echo "Exiting..."
      break
      ;;
    # handling invalid (non numeric) input in menu
    "")
      echo "Invalid selection. Please try again."
      ;;
    *)
      echo "Invalid option: $REPLY. Please try again."
      ;;
  esac
done
