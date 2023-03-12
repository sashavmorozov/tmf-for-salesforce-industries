@isTest
private class TMFRelatedEntityTest {
    
    @isTest
    static void testTMFRelatedEntityConstructor() {
        
        Product2 product = TMF687TestDataFactory.createTestProduct();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);
        
        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"@referredType": "ProductOrder",' + '\n' +
            '"@type": "EntityRef",' + '\n' +
            '"href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(ord.Id) + '",' + '\n' +
            '"id": "' + Id.valueOf(ord.Id) + '",' + '\n' +
            '"name": "TMF687 Test Order",' + '\n' +
            '"role": "Related order"' + '\n' +
        '}';

        TMFRelatedEntity relatedEntity = new TMFRelatedEntity(ord);    
        
        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(relatedEntity, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
    }

    @isTest
    static void testEnrichInput() {

        Product2 product = TMF687TestDataFactory.createTestProduct();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);

        TMFRelatedEntity relatedEntity = new TMFRelatedEntity(ord); 

        Order enrichedRecord = relatedEntity.enrichInput(ord);

        Assert.areEqual('TMF687 Test Order', enrichedRecord.Name, 'Expected and actual Name do not match');
    }
}
