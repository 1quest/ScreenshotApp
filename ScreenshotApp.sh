#!/bin/bash
#This is a shell script to take Screenshots
echo -e "
[ 1 ] Move the mouse to next-page button \n
[ 2 ] Take one screenshot of the area and try to save\n
[ 3 ] Run the main loop \n"

#Now read the user input
read UserInput

#Now we will use switch cases to implement the UserInput
#Create the pdf by moving all image to one directory and running convert * book.pdf
#Make the book searchable by installing sudo apt install ocrmypdf
#And running ocrmypdf book.pdf book_searchable.pdf

case $UserInput in
    1)
    #Edit the x and y corrdinates to find the next-page button, or the borders of the image capture - remember this is only for the main-screen
    #Add command --display=[DISPLAY] for switching displays
    xdotool mousemove 1680 1070
    # By default it will capture the whole screen
    ;;
    2)
    #Take one screenshot of area and save as test
    (gnome-screenshot -af "test" &); sleep 0.1 && xdotool mousemove 448 175 mousedown 1 mousemove 1470 1040 mouseup 1
    # here -s is interactive window decision
    ;;
    3)
    #Run the main loop, takes i number of pictures and save with name "p" + i
    #Change to number of next-page presses in the for loop, {001 ...} is for the file to be named e.g. p001 and sort correctly when merging to pdf
    sleep 2
    for i in {001..242}
    do
    (gnome-screenshot --file=p$i -a &); sleep 0.5 && xdotool mousemove 448 175 mousedown 1 mousemove 1470 1040 mouseup 1
    sleep 0.75 &&
    xdotool mousemove 1680 1070 mousedown 1 mouseup 1 &&
    sleep 0.75
    done
    *)
    echo -e "Please Enter Correct Input \n"
    ;;
esac
