﻿-------------------------------------------------------------------------------
-- Tests for timestamp set data type.
-- File TimestampSet.c
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Constructor
-------------------------------------------------------------------------------

SELECT timestampset(ARRAY [timestamp '2000-01-01', '2000-01-02', '2000-01-03']);
-- Error
SELECT timestampset(ARRAY [timestamp '2000-01-01', '2000-01-01', '2000-01-03']);
SELECT timestampset('{}'::timestamptz[]);

-------------------------------------------------------------------------------
-- Casting
-------------------------------------------------------------------------------

SELECT timestampset(timestamp '2000-01-01');
SELECT timestamptz '2000-01-01'::timestampset;

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

SELECT memSize(timestampset '{2000-01-01}');
SELECT memSize(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}');

SELECT timespan(timestampset '{2000-01-01}');
SELECT timespan(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}');

SELECT numTimestamps(timestampset '{2000-01-01}');
SELECT numTimestamps(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}');

SELECT startTimestamp(timestampset '{2000-01-01}');
SELECT startTimestamp(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}');

SELECT endTimestamp(timestampset '{2000-01-01}');
SELECT endTimestamp(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}');

SELECT timestampN(timestampset '{2000-01-01}', 1);
SELECT timestampN(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}', 1);
SELECT timestampN(timestampset '{2000-01-01}', 2);
SELECT timestampN(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}', 4);

SELECT timestamps(timestampset '{2000-01-01}');
SELECT timestamps(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}');

SELECT shift(timestampset '{2000-01-01}', '5 min');
SELECT shift(timestampset '{2000-01-01, 2000-01-02, 2000-01-03}', '5 min');

SELECT timestampset_cmp(timestampset '{2000-01-01}', timestampset '{2000-01-01, 2000-01-02, 2000-01-03}') = -1;
SELECT timestampset '{2000-01-01}' = timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';
SELECT timestampset '{2000-01-01}' <> timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';
SELECT timestampset '{2000-01-01}' < timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';
SELECT timestampset '{2000-01-01, 2000-01-02, 2000-01-03}' < timestampset '{2000-01-01}';
SELECT timestampset '{2000-01-01}' <= timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';
SELECT timestampset '{2000-01-01}' > timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';
SELECT timestampset '{2000-01-01}' >= timestampset '{2000-01-01, 2000-01-02, 2000-01-03}';

-------------------------------------------------------------------------------
