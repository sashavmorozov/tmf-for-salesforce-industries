/*

Reference: https://datamodel.tmforum.org/en/latest/Common/TimePeriod/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Common/TimePeriod.schema.json

Initialized based on:
 - Order Item parameters (not records)

Fields:
 - startDateTime: Start of the time period, using IETC-RFC-3339 format. If you define a start, you must also define an end
 - endDateTime: End of the time period, using IETC-RFC-3339 format
    
Example:
{
    "startDateTime": "1985-04-12T23:20:50.52Z",
    "endDateTime": "2018-09-21T09:13:16-07:00"
} 

Notes:
 - n/a

*/

public with sharing class TMFTimePeriod {

    Datetime startDateTime;
    Datetime endDateTime;

    public TMFTimePeriod(Datetime startDateTime, Datetime endDateTime) {
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
    }

    public Datetime getStartDateTime() {
        return this.startDateTime;
    }
    
    public Datetime getEndDateTime() {
        return this.endDateTime;
    }
    
    public void setStartDateTime(Datetime startDateTime) {
        this.startDateTime = startDateTime;
    }
    
    public void setEndDateTime(Datetime endDateTime) {
        this.endDateTime = endDateTime;
    }
}