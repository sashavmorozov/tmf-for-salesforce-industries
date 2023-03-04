public with sharing class TMFTimePeriod {

    /* 
    
    startDateTime: 
        Description: Start of the time period, using IETC-RFC-3339 format. If you define a start, you must also define an end
        Behavior: Optional
        Example: 2020-09-25T10:12:23.664Z

    endDateTime: 
        Description: End of the time period, using IETC-RFC-3339 format. Optional. 2020-09-25T10:12:23.664Z 
        Behavior: Optional
        Example: 2020-09-25T10:12:23.664Z
    
    */

    Datetime startDateTime;
    Datetime endDateTime;

    public TMFTimePeriod() {

    }
    
    public TMFTimePeriod(Datetime startDateTime, Datetime endDateTime) {
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
    }
}