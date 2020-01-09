#!/bin/bash

DIR=/home/$USER/TRASH 

if [[ -d "$DIR" ]]
then

for i in $*
do	
  if [ -f $i ]
  then
    gzip -t $i 2>/dev/null
    if [[ $? -eq 0 ]]
    then
      mv $i $DIR
      echo "file $i is already comp"
    else
      echo "file $i not comp"
      tar czf $i.tar.gz $i
      mv $i $DIR
      echo "file $i removed"
    fi
  elif [[ -d $i ]]
  then
     gzip -r $i 
     tar -zcvf "$i.tar.gz" $i 
     mv "$i.tar.gz" $DIR
     echo "dir $i removed" 

  else
    echo "file dosen't exist"
  fi
done

else
mkdir $DIR

for i in $*
do      
  if [ -f $i ]
  then
    gzip -t $i 2>/dev/null
    if [[ $? -eq 0 ]]
    then
      mv $i $DIR
      echo "file $i is already comp"
    else
      echo "file $i not comp"
      tar czf $i.tar.gz $i
      mv $i $DIR
      echo "file $i removed"
    fi
  elif [[ -d $i ]]
  then
    gzip -r $i 
    tar -zcvf "$i.tar.gz" $i 
    mv "$i.tar.gz" $DIR
    echo "dir $i removed" 
  else
    echo "file dosen't exist"
  fi
done
fi
