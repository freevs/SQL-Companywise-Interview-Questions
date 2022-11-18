### SOLUTION

To compare the viewership on laptops versus mobile devices, we can use a CASE conditional statement to define the device type according to the question's specifications.

The tablet and phone categories are considered to be the 'mobile' device type and the laptop can be set as its own device type (i.e., 'laptop').

      SELECT 
      CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END AS laptop_views, 
      CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END AS mobile_views 
      FROM viewership;
      
 laptop_views|	mobile_views
 ---|---
0|	1
1	|0
1	|0
0	|1
0	|1

Let us explain how the CASE statement works using the mobile_views field as an example.

When the device is a tablet or a phone, it is assigned the value of 1. Otherwise, it is given the value of 0.
The IN operator after device_type means OR, as in when the device type is a table OR phone, then it is assigned the value of 1.
Next, we calculate the number of viewership for laptops and mobiles. We can do so by applying the SUM function.

     SELECT 
     SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
     SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
     FROM viewership;
     
 laptop_views	|mobile_views
 ---|---
2|	3

Ok, timeout guys!

We want you to take a step back and ask yourself this "Why can't you use the COUNT function instead since we're essentially "counting" the number of viewership?"

Say, we apply the COUNT function to the solution instead.

      -- Incorrect solution
      SELECT 
      COUNT(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
      COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
      FROM viewership;

Instead of adding the values of 1 and 0, using COUNT will count the number of rows instead which gives you the following output of 5 laptop views and 5 mobile views. That's counterintuitive!

laptop_views|	mobile_views
---|---
5|	5

There's another way that you can use the COUNT function and obtain the correct output. Since COUNT is counting the number of values in the rows, what you can do is switch out the value of 0 with NULL instead.

      -- Another correct solution
      SELECT 
      COUNT(CASE WHEN device_type = 'laptop' THEN 1 ELSE NULL END) AS laptop_views, 
      COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE NULL END) AS mobile_views 
      FROM viewership;
      
 With this query, only the correctly assigned device type gets the value of 1.
