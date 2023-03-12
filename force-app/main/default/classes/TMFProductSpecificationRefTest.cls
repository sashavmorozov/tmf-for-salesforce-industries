@isTest
private class TMFProductSpecificationRefTest {
    
    @isTest
    static void testTMFProductSpecificationRefConstructor() {

        Product2 productSpecification = TMF687TestDataFactory.createTestProduct();

        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"@type": "ProductSpecification",' + '\n' +
            '"href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(productSpecification.Id) + '",' + '\n' +
            '"name": "TMF687 Test Product",' + '\n' +
            '"version": "TMF687 Test Product Version",' + '\n' +
            '"id": "' + Id.valueOf(productSpecification.Id) + '"' + '\n' + 
        '}';

        
        TMFProductSpecificationRef productSpecificationRef = new TMFProductSpecificationRef(productSpecification); 

        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(productSpecificationRef, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
        
    }

    @isTest
    static void testEnrichInput() {

        Product2 productSpecification = TMF687TestDataFactory.createTestProduct();
        TMFProductSpecificationRef productSpecificationRef = new TMFProductSpecificationRef(productSpecification); 

        Product2 enrichedRecord = productSpecificationRef.enrichInput(productSpecification);

        Assert.areEqual('TMF687 Test Product', enrichedRecord.Name, 'Expected and actual Name do not match');
        Assert.areEqual('TMF687 Test Product Description', enrichedRecord.Description, 'Expected and actual Description do not match');
        Assert.areEqual('TMF687 Test Product Version', enrichedRecord.vlocity_cmt__VersionLabel__c, 'Expected and actual Version do not match');
        
    }
}
