@IsTest
private class TMFTimePeriodTest {
    
    @IsTest
    static void testTimePeriodConstructor() {
        // Test the constructor with valid arguments

        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"startDateTime": "1985-04-12T23:20:50.000Z",' + '\n' +
            '"endDateTime": "2018-09-21T09:13:16.000Z"' + '\n' +
        '}';

        Datetime tpStart = Datetime.newInstanceGmt(1985, 4, 12, 23, 20, 50);
        Datetime tpEnd = Datetime.newInstanceGmt(2018, 9, 21, 9, 13, 16);
        TMFTimePeriod tp = new TMFTimePeriod(tpStart, tpEnd);

        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(tp).replace('at_', '@'));
    }

    @isTest
    static void testGettersAndSetters() {
        // Test that the getters and setters work correctly
        Datetime tpStart = Datetime.newInstanceGmt(2022, 1, 1, 0, 0, 0);
        Datetime tpEnd = Datetime.newInstanceGmt(2022, 1, 31, 23, 59, 59);
        TMFTimePeriod tp = new TMFTimePeriod(tpStart, tpEnd);
        
        tp.setStartDateTime(tpStart);
        Assert.areEqual(tpStart, tp.getStartDateTime());

        tp.setEndDateTime(tpEnd);
        Assert.areEqual(tpEnd, tp.getEndDateTime());
    }
    
}
