#!/bin/bash

DATE="17JULY2023"
NO_OF_SESSIONS=$(who|wc -l)
echo "Good Morning , Todays date is $DATE"
echo "Total Number of Connected Sessions : $NO_OF_SESSIONS"