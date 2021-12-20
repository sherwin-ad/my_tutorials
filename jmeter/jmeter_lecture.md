# Jmeter

## What is JMeter and why it is used?

- JMeter is a test tool from Apache used to analyze and measure the performance of applications, different software services and products. 
- It is open source software entirely written in Java, used to test both web and FTP applications as long as the system supports a Java Virtual Machine (JVM).



## Jmeter recording using Firefox

1. Go to Test Plan > Add > Non-Test Elements > HTTP(S) Test Script Recorder

![image-20211216113836808](images\image-20211216113836808.png)

2. Goto "Test Plan Creation" tab change "Target Controller" to Test Plan > HTTP(S) Test Script Recorder

3. Goto "Request Filtering" tab and click "Add suggeted Excludes" button

4. Change the network settings of Firefox browser to Manual proxy configuration 127.0.0.1 to port 8888

   ![image-20211216115145574](images\image-20211216115145574.png)

5. Import Jmeter certificate in Firefox

6. Start recording in Jmeter while browsing in Firefox

## Recording using Chrome with extension BlazeMeter

1. Install BlazeMeter extension in Chrome

https://chrome.google.com/webstore/detail/blazemeter-the-load-testi/mbopgmdnpcbohhpnfglgohlbhfongabi?hl=en

2. Register and Sign in
3. Start recording and save the recordings as .jmx
4. Open jmx file in Jmeter 

## What is Thread Group?

- A `thread group` is a set of threads/users executing the same scenario.

1. Add Thread Group. Right Test Plan > Add > Thread (Users) > Thread Group
2. Move requests to Thread Group
3. Add Listeners > Right click Thread Group > Add > Listener 
   - View Results tree
   - Aggregate Report
   - Graph Results
4. Click Start icon

## Understand the Jmeter Load parameters to analyze results

**Samples** : No of users hit that specific request = 2153

**Average:** It is the average time taken by all the samples to execute specific label.  = 129 Milli seconds

**Min:** The shortest time taken by a sample for specific label. 

**Max:** The longest time taken by a sample for specific label

**Std. Dev.:** This shows the set of exceptional cases which were deviating from the average value of sample response time. The lesser this value more consistent the data. Standard deviation should be less than or equal to half of the average time for a label.

**Error%:** Percentage of Failed requests per Label.

**Throughput:** Throughput is the number of request that are processed per time unit(seconds, minutes, hours) by the server. This time is calculated from the start of first sample to the end of the last sample. Larger throughput is better. 

**Median:** It is the time in the middle of a set of samples result. It indicates that 50% of the samples took no more than this time i.e the remainder took at least as long.

**90% Line:** 90% of the samples took no more than this time. The remaining samples took at least as long as this. (90th percentile)

## Additional Plugins for Simulating real time Load
Download the jar from Jmeter plugins
https://jmeter-plugins.org/wiki/PluginsManager/
Concurrency Thread Group
Ultimate Thread Group



## HTTP Cookie Manager

**Add HTTP Cookie Manager**

Thread Group > Add > Config Element > Http Cookie Manager



