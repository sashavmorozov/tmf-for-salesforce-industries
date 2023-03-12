@isTest
private class TMFRelatedPartyTest {
    
    @isTest
    static void testTMFRelatedPartyConstructor() {

        Account account = TMF687TestDataFactory.createTestCustomerAccount();
        
        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"@referredType": "Business",' + '\n' +
            '"@type": "PartyRef",' + '\n' +
            '"href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(account.Id) + '",' + '\n' +
            '"id": "' + Id.valueOf(account.Id) + '",' + '\n' +
            '"role": "Related account"' + '\n' +
        '}';

        TMFRelatedParty relatedParty = new TMFRelatedParty(account);        
        
        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(relatedParty, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
        
    }

    @isTest
    static void testEnrichInput() {

        Account account = TMF687TestDataFactory.createTestCustomerAccount();
        TMFRelatedParty relatedParty = new TMFRelatedParty(account);

        Account enrichedRecord = relatedParty.enrichInput(account);

        Assert.areEqual('TMF687 Test Customer Account - Business', enrichedRecord.Name, 'Expected and actual Name do not match');
        Assert.areEqual('Business', enrichedRecord.RecordType.DeveloperName, 'Expected and actual RecordType do not match');
        
    }
}
