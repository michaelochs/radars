# NSDateComponentsFormatter with leading zeroes does not format negative time intervals correctly

Summary:
When using an NSDateComponentsFormatter that displays leading zeroes to format a negative time interval, the minus sign is not visible.

Steps to Reproduce:
- Open the sample project
- Run it on a device or simulator

Expected Results:
The output in the text view should be:
Interval: -3600, Formatter: -1:00:00
Interval: -1800, Formatter: -0:30:00
Interval: 0, Formatter: 0:00:00
Interval: 1800, Formatter: 0:30:00
Interval: 3600, Formatter: 1:00:00

Actual Results:
The output actually is (note the missing minus sign in line two)
Interval: -3600, Formatter: -1:00:00
Interval: -1800, Formatter: 0:30:00
Interval: 0, Formatter: 0:00:00
Interval: 1800, Formatter: 0:30:00
Interval: 3600, Formatter: 1:00:00

Regression:

Notes:
While the leading 0 might not need a sign, the overall interval that is displayed by the formatter is still negative. The formatter drops this information. The output of `-1800` and `1800` in the above example is exactly the same.
Furthermore the documentation of `-[NSDateComponentsFormatter stringFromTimeInterval:]` states “Negative numbers are treated as positive numbers when creating the string.” which obviously is not true, as intervals that are negative and whose first digit is not 0 do show the minus sign.

From my perspective, the ideal solution would be to remove that sentence from the documentation and make it official that negative intervals are handled, and then fix the above sample to show the result I listed under expected result.
