#!/bin/bash
#penjadwalan untuk program autmatic update

(crontab -l ; echo "39 13 * * 4  /home/marcel/kuliah/adsis/bash/project/project.sh >> /dev/pts/2")| crontab -
