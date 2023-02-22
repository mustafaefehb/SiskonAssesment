
SELECT 
DE.DowntimeDataID,

CASE 
WHEN (DE.DowntimeStart BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) THEN DE.DowntimeStart
WHEN (DE.DowntimeFinish BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) THEN SC.ShiftStartTime
END AS DowntimeStart,

CASE 
WHEN (DE.DowntimeFinish BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) THEN DE.DowntimeFinish
ELSE SC.ShiftEndTime
END AS DowntimeFinish,

CASE 
WHEN (DE.DowntimeStart BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) AND (DE.DowntimeFinish BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) THEN DATEDIFF(MINUTE,DE.DowntimeStart, DE.DowntimeFinish)
WHEN (DE.DowntimeStart BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) AND (DE.DowntimeFinish NOT BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) THEN DATEDIFF(MINUTE,DE.DowntimeStart, SC.ShiftEndTime)
WHEN (DE.DowntimeFinish BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) AND (DE.DowntimeStart NOT BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime) THEN DATEDIFF(MINUTE,SC.ShiftStartTime, DE.DowntimeFinish)

END AS DowntimeDuration,

DE.DowntimeStart AS OriginalDowntimeStart,
DE.DowntimeFinish AS OriginalDowntimeFinish,
DATEDIFF(MINUTE,DE.DowntimeStart, DE.DowntimeFinish) AS OriginalDowntimeDuration,
DE.EventCount,
SC.ShiftStartTime,
SC.ShiftEndTime
FROM
DowntimeEntry DE

JOIN 
ShiftCalendar SC 
ON 
(DE.DowntimeStart BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime)
OR
(DE.DowntimeFinish BETWEEN SC.ShiftStartTime AND SC.ShiftEndTime)
ORDER BY 
SC.ShiftStartTime
