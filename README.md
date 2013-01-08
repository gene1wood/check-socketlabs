# Nagios plugin: check_socketlabs

This is a nagios plugin that interacts with the 
[SocketLabs API](http://www.socketlabs.com/api-reference/) 
to enable monitoring of a SocketLabs account. The plugin fetches the count of 
messages that have been queued to be processed (sent to SocketLabs) and the 
count of messages that have been processed (accepted by the recipients MTA) 
and checks that the percentage of queued messages that have not yet been 
processed is below a given threshold. Ideally, there should be the same number 
of messages queued as processed.

The window of time over which this check can be made is configuarable. This 
can be set by defining the length of the window and the offset from now. To 
check from 2 minutes ago to 10 minutes ago, one could set the `threshold` 
option to 2 and the `window` option to 8.

## Usage

    Usage:
          check_socketlabs [options]
    where [options] are:
          --api-user, -u <s>:   SocketLabs Username
      --api-password, -p <s>:   SocketLabs API Password
         --server-id, -s <s>:   SocketLabs Server ID
         --threshold, -T <i>:   Threshold percentage to alert at (default: 10)
            --window, -w <i>:   Window size in minutes to test (default: 15)
            --offset, -o <f>:   Number of minutes ago to begin the testing window (default: 0.5)
           --timeout, -t <i>:   SocketLabs API timeout (default: 10)
               --verbose, -v:   Verbose output
                  --help, -h:   Show this message


## Example output

    $ check_socketlabs -u myuser -p drowssap -s 1234
    OK: percentage of emails which have been queued but not processed over the last 15 minutes is 1.00 which is under the threshold of 10

    $ check_socketlabs -u myuser -p drowssap -s 1234 -w 30 -o 5
    CRITICAL: 14% of emails over the 30 minute window have not been processed. This exceeds the allowed threshold of 10%

    $ check_socketlabs -u myuser -p drowssap -s 1234
    OK: there have been more emails processed over the 15 minute window (39) than have been queued (37)

## How to build

    gem build check_socketlabs.gemspec

## How to package
To turn the gem into an rpm one can use [fpm](https://github.com/jordansissel/fpm)

    fpm -s gem -t rpm check_socketlabs-0.0.1.gem

