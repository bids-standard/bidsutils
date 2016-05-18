
Contributed by Tom Nichols. See attached for BIDSto3col.sh.  From the help...

```
Usage: BIDSto3col.sh [options] BidsTSV OutBase 

Reads BidsTSV and then creates 3 column event files, one per event type, 
using the basename OutBase.  By default, all event types are used, and the 
height value (3rd column) is 1.0.

Options
  -e EventName   Instead of all event types, only use the given event type.
  -s EventName   Treat all rows as a single event type; specify the EventName
                 to be used when creating the file name for the 3 column file.
  -h ColName     Instead of using 1.0, get height value from given column.
  -N             By default, when creating 3 column files any spaces in the 
                 event name are replaced with "_"; use this option to
                 prevent this replacement.
```

Examples of usage:

```
  $ BIDSto3col.sh ds001/sub-13/func/sub-13_task-balloonanalogrisktask_run-01_events.tsv /tmp/duh
  $ BIDSto3col.sh -e cash_demean ds001/sub-13/func/sub-13_task-balloonanalogrisktask_run-01_events.tsv /tmp/duh
  $ BIDSto3col.sh -e cash_demean -h explode_demean ds001/sub-13/func/sub-13_task-balloonanalogrisktask_run-01_events.tsv /tmp/duh
  $ BIDSto3col.sh -s Event sub-01_task-mixedgamblestask_run-01_events.tsv OUT
  $ BIDSto3col.sh -s Ev -h "parametric loss" sub-01_task-mixedgamblestask_run-01_events.tsv OUT
```

Note that it checks for non-numeric heights (and missing event names and/or column names).
