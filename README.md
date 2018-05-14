# Elastic configurations for Sardana Centralized Logging System

This repository contains configuration files being developed for the Sardana
Centralized Logging System.

# Logtrail

## How to debug Sardana with LogTrail

Usually when a problem occurs in your Sardana system one would like to access the server logs in order to find the root cause of the failure. Below are listed suggestions on how to achieve that with the LogTrail depending on the starting information.

### You know more or less when the problem occured

For example your MacroServer server was restarted on March 5th 2018 at 14:25:15.670 and you would like to know if there were any abnormal issues just before the restart.

1. Open Kibana and go to the LogTrail view.
2. In the search text box type a range of dates that you would like to extract the logs. For example for 5 minutes before the restart use `program.keyword:"MacroServer" AND @timestamp:["2018-03-05T14:21" TO "2018-03-05T14:26"]`.
3. Use scroll to look for the relevant information.

## Logtrail configuration hints

* For multiple Sardana system it is better to define one index pattern per one system. This would avoid high load and possible crashes of the plugin. Simply add mutliple dictionaries in the list.
* Sardana pushes to elastic search always logs in UTC. The default `display_timezone` configuration (local) would use your local browser timezone. This configuration may affect searches based on timestamp. As a workaround it is recomended to use UTC timezone.
