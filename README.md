# Elastic configurations for Sardana Centralized Logging System

This repository contains configuration files being developed for the Sardana
Centralized Logging System.

# Logtrail

## How to debug Sardana with LogTrail

Usually when a problem occurs in your Sardana system one would like to access
the server logs in order to find the root cause of the failure. Below are
listed suggestions on how to achieve that with the LogTrail depending on
the starting information.

### You know more or less when the problem occurred

For example your MacroServer server was restarted on March 5th 2018
at 14:25:15.670 and you would like to know if there were any abnormal issues
just before the restart.

1. Open Kibana and go to the LogTrail view.
2. Click on the "Now" button and specify the date and time just before this 
event e.g. "March 17 14:25", "17 March 2 pm", etc. 
3. Logtrail will extract all the events after this moment.

An alternative to this would be to precisely specify the timestamp range:
`program.keyword:"MacroServer" AND @timestamp:["2018-03-05T14:21" TO "2018-03-05T14:26"]`.
in the search button.

Note: the search will work only for the time period configured in 
`default_time_range_in_days`.

## Logtrail configuration hints

* For multiple Sardana system logging to the same elasticsearch database it
is better to  define one index pattern per one system. This would avoid mixing
unreladed logs in the LogTrail view. Simply add mutliple dictionaries in the
list and then switch between them using the "Settings" button.
* As the indexes grows, Logtrail may become slow on on startup and on 
searches. This is because its default configuration `default_time_range_in_days`
searches in all the indexes. Setting it to one week (7) improves a lot the 
Logtrail responsiveness.  
