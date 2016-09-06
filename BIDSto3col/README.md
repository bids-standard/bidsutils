
Contributed by Tom Nichols. See attached for BIDSto3col.sh.  From the help...

```
Usage: BIDSto3col.sh [options] BidsTSV OutBase 

Reads BidsTSV and then creates 3 column event files, one per event
type; files are named as basename OutBase and appended with the event
name. By default, all event types are used, and the height value (3rd
column) is 1.0.  

Assumes the presense of a (BIDS optional) "trial_type" column.  Use -t 
option to set a different name for this column, or -s to ignore trial
type. 

Options
  -e EventName   Instead of all event types, only use the given event
                 type. 
  -s EventName   Treat all rows as a single event type; specify the
                 EventName to be used when creating the file name for
                 the 3 column file. 
  -n             When only one event type (e.g. when -e or -s option
                 used) do not append the event name to OutBase. 
  -h HtColName   Instead of using 1.0, get height value from given
                 column; two files are written, the unmodulated (with
                 1.0 in 3rd column) and the modulated one, having a
                 "_pmod" suffix. 
  -d DurColName  Instead of getting duration from the "duration"
                 column, take it from this named column.
  -t TypeColName Instead of getting trial type from "trial_type"
                 column, use this column.
  -N             By default, when creating 3 column files any spaces
                 in the event name are replaced with "_";
                 use this option to prevent this replacement.
```

Here's a demo...

```
  $ BIDSto3col.sh ds001/sub-13/func/sub-13_task-balloonanalogrisktask_run-01_events.tsv /tmp/duh
  Creating '/tmp/duh_cash_demean.txt'...
  Creating '/tmp/duh_cash_fixed_real_RT.txt'...
  Creating '/tmp/duh_control_pumps_demean.txt'...
  Creating '/tmp/duh_control_pumps_fixed_real_RT.txt'...
  Creating '/tmp/duh_explode_demean.txt'...
  Creating '/tmp/duh_pumps_demean.txt'...
  Creating '/tmp/duh_pumps_fixed_real_RT.txt'...
  $ BIDSto3col.sh -e cash_demean ds001/sub-13/func/sub-13_task-balloonanalogrisktask_run-01_events.tsv /tmp/duh
  Creating '/tmp/duh_cash_deman.txt'...
  $ BIDSto3col.sh -e cash_demean -h explode_demean ds001/sub-13/func/sub-13_task-balloonanalogrisktask_run-01_events.tsv /tmp/duh
  Creating '/tmp/duh_cash_demean.txt'...
  	WARNING: Event 'cash_demean' has non-numeric heights from 'explode_demean'
```

Note that it checks for non-numeric heights (and missing event names and/or column names).
