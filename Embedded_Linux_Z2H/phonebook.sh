#!/bin/bash
if [[ ! -f phonebookDB.txt ]]
then
touch phonebookDB.txt
fi
if [[ $1 = "-i" ]]
then
  read -p "please enter the contact's first Name: " new_fname
  read -p "please enter the contact's second Name: " new_sname
  fname_len=${#new_fname} 
  sname_len=${#new_sname} 
  if [[ $fname_len -gt 1 && $sname_len -gt 1 && $fname_len -lt 10 && $sname_len -lt 10 ]]
  then
    if [[ `grep -n "^$new_fname" phonebookDB.txt` ]]
    then
      if [[ `grep -n "$new_sname" phonebookDB.txt` ]]
      then
        echo "this name already exists, please try again with different name"
      else
        read -p "please enter the phone number: " new_number
        num_len=${#new_number} 
        if [[ ${new_number:0:1} == "0" ]]
        then 
          if [[ $num_len == 11 ]]
          then
            echo -n $new_fname >> phonebookDB.txt
            echo -n  " " >> phonebookDB.txt
            echo -n $new_sname >> phonebookDB.txt
            echo -n  "   " >> phonebookDB.txt
            echo -n $new_number >> phonebookDB.txt
            read -p "do you want to add another number? y/n  : " num_if
            if [[ $num_if = "y" || $num_if = "Y" ]]
            then
              read -p "please enter the phone number: " new2_number
              num2_len=${#new2_number} 
              if [[ ${new2_number:0:1} = "0" ]]
              then 
                if [[ $num2_len == 11 ]]
                then
                  echo -n  "   " >> phonebookDB.txt
                  echo $new2_number >> phonebookDB.txt
                  echo "contact saved"
                else
                  echo "contact's number must be 11 digits, please try again"
                fi
              else 
                echo "contact's number must start with 0, please try again"
              fi
            elif [[ $num_if = "n" || $num_if = "N" ]]
            then
              echo " " >> phonebookDB.txt 
              echo "contact saved"
            else
              echo "invalid option"
            fi
          else
            echo "contact's number must be 11 digits, please try again" 
	  fi
        else 
          echo "contact's number must start with 0, please try again"
        fi 
      fi 
    else
      read -p "please enter the phone number: " new_number
      num_len=${#new_number} 
      if [[ ${new_number:0:1} = "0" ]]
      then 
        if [[ $num_len == 11 ]]
        then
          echo -n $new_fname >> phonebookDB.txt
          echo -n  " " >> phonebookDB.txt
          echo -n $new_sname >> phonebookDB.txt
          echo -n  "   " >> phonebookDB.txt
          echo -n $new_number >> phonebookDB.txt
          read -p "do you want to add another number? y/n  : " num_if
          if [[ $num_if = "y" || $num_if = "Y" ]]
          then
            read -p "please enter the phone number: " new2_number
            num2_len=${#new2_number} 
            if [[ ${new2_number:0:1} = "0" ]]
            then 
              if [[ $num2_len == 11 ]]
              then
                echo -n  "   " >> phonebookDB.txt
                echo $new2_number >> phonebookDB.txt
                echo "contact saved"
              else
                echo "contact's number must be 11 digits, please try again"
              fi
            else 
              echo "contact's number must start with 0, please try again"
            fi
          elif [[ $num_if = "n" || $num_if = "N" ]]
          then
            echo " " >> phonebookDB.txt 
            echo "contact saved"
          else
            echo "invalid option"
          fi
        else
          echo "contact's number must be 11 digits, please try again" 
        fi
      else 
        echo "contact's number must start with 0, please try again"
      fi  
    fi
   else
   echo "name is too short or too long, please try again"
   fi



elif [[ $1 = "-v" ]]
then
  cat phonebookDB.txt


elif [[ $1 = "-s" ]]
then
  read -p "please enter a full name to search for: " search_name
  search_len=${#search_name} 
  if [[ $search_len -gt 0 ]]
  then
    if [[ `grep -n $search_name phonebookDB.txt` ]]
    then
      echo "contact found"
      grep -i $search_name phonebookDB.txt
    else
      echo "contact doesn't exist"
    fi
  else
    echo "name is too short, try again"
  fi


elif [[ $1 = "-e" ]]
then
 read -p "you are going to delete all your phonebook's contacts, are you sure? y/n  : " delete_if
          if [[ $delete_if = "y" || $delete_if = "Y" ]]
          then
            echo "" > phonebookDB.txt
            echo "your phonebook is empty now"
          elif [[ $delete_if = "n" || $delete_if = "N" ]]
          then
            echo "nothing deleted"
          else
            echo "invalid option"
          fi
elif [[ $1 = "-d" ]]
then
  echo "these are all the current contacts in your phone book, choose one to delete"
  cat phonebookDB.txt
  read -p "please enter a contact's first name to delete: " delete_fname
  read -p "please enter a contact's second name to delete: " delete_sname   
  fdelete_len=${#delete_fname} 
  sdelete_len=${#delete_sname} 
  if [[ $fdelete_len -gt 1 && $sdelete_len -gt 1 ]]
  then
    if [[ `grep -n "^$delete_fname" phonebookDB.txt` && `grep -n "$delete_sname"  phonebookDB.txt` ]]
    then
      sed -i "/$delete_fname $delete_sname/d" phonebookDB.txt
      echo "contact deleted"
    else
      echo "contact doesn't exist"
      echo "this all contacts in your phonebook, try again"
      cat phonebookDB.txt 
    fi 
  else
    echo "contact's name is too short, try again"
  fi

elif [[ $# == 0 ]]
then
    echo "these are the available choices to run this script"
    echo "-i to add new contact choose "
    echo "-v to view all saved contacts choose "
    echo "-s to Search by contact name "
    echo "-e to Delete all records choose "
    echo "-d to Delete only one contact name "
else
    echo "invalid option, please choose one of these choices to run the script"
    echo "-i to add new contact choose "
    echo "-v to view all saved contacts choose "
    echo "-s to Search by contact name "
    echo "-e to Delete all records choose "
    echo "-d to Delete only one contact name "
fi

