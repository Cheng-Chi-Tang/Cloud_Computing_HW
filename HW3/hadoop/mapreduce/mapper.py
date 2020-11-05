#!/usr/bin/env python
import sys
#format: 64.242.88.10 - - [07/Mar/2004:16:05:49 -0800] "GET /twiki/bin/edit/Main/Double_bounce_sender?topicparent=Main.ConfigurationVariables HTTP/1.1" 401 12846

#expected output: 07/Mar/2004:16 1 (timestamp to hour \t count)
for line in sys.stdin:
    # trim
    line = line.strip()
    # split
    words = line.split()
    
    # some request get 408 error

    srcIP = words[0]
    timestamp = words[3].replace("[", "")[:14] + ":00:00"
    zone = words[4].replace("-", "").replace("]", "")
    
   
        #print("zone:",  zone)
        #print("rest", REST)
        #print("timestamp", timestamp)
    if len(words) == 10: #if request successful -- get all attributes
        REST = words[5].replace("\"", "")
        request_url, protocol, status, size = words[6] , words[7].replace("\"", ""), words[8], words[9]
        attr = [srcIP, timestamp, zone, REST, request_url, protocol, status, size]
    #for i in attr:
    print timestamp + "\t1"