    #!/bin/bash
    
    logfile="sinklog.txt"
    host1=123.123.123.123    # host1 is Source
    host2=321.321.321.321    # host2 is Dest
    domain=xyz.com           # domain is where email account is
                             # everything after @ symbol
    
    ###### Do not modify past here ######
    date=`date +%X_-_%x`
    echo "" >> $logfile
    echo "------------------------------------" >> $logfile
    echo "IMAPSync started..  $date" >> $logfile
    echo "" >> $logfile
    
    { while IFS=';' read  u1 p1; do 
            user=$u1"@"$domain    
    	      echo "Syncing User $user"
            date=`date +%X_-_%x`
            echo "Start Syncing User $u1"
            echo "Starting $u1 $date" >> $logfile
            imapsync --nosyncacls --syncinternaldates --host1 $host1 --user1 "$user" --password1 "$p1" --host2 $host2 --user2 "$user" --password2 "$p1"  --nofoldersizes --skipsize --fast
            date=`date +%X_-_%x`
            echo "User $user done"
            echo "Finished $user $date" >> $logfile
            echo "" >> $logfile
            done ; } < userlist.txt
    
    date=`date +%X_-_%x`
    echo "" >> $logfile
    echo "IMAPSync Finished..  $date" >> $logfile
    echo "------------------------------------" >> $logfile
