@isTest
private class TMFProductRefOrValueTest {
    
    @isTest
    static void testTMFProductRefOrValueConstructor() {

        Product2 product = TMF687TestDataFactory.createTestProduct();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Account serviceAccount = TMF687TestDataFactory.createTestServiceAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);

        String expectedPayloadString = '\n' +
        '{' + '\n' +
        '  "productSpecification": {' + '\n' +
        '    "version": "TMF687 Test Product Version",' + '\n' +
        '    "name": "TMF687 Test Product",' + '\n' +
        '    "id": "' + Id.valueOf(product.Id) + '",' + '\n' +
        '    "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(product.Id) + '",' + '\n' +
        '    "@type": "ProductSpecification"' + '\n' +
        '  },' + '\n' +
        '  "productOrderItem": [ {' + '\n' +
        '    "productOrderId": "' + Id.valueOf(ord.Id) + '",' + '\n' + 
        '    "productOrderHref": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(ord.Id) + '",' + '\n' +
        '    "orderItemId": "' + Id.valueOf(orderItem.Id) + '",' + '\n' +
        '    "orderItemAction": "Add",' + '\n' +
        '    "id": "' + Id.valueOf(orderItem.Id) + '",' + '\n' +
        '    "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(orderItem.Id) + '"' + '\n' +
        '  } ],' + '\n' +
        '  "productCharacteristic": [ {' + '\n' +
        '    "value": "1363636277",' + '\n' +
        '    "name": "Billing Code",' + '\n' +
        '    "id": "ATTRIBUTE-117"' + '\n' +
        '  }, {' + '\n' +
        '    "value": "bee.io",' + '\n' +
        '    "name": "Provider",' + '\n' +
        '    "id": "ATTRIBUTE-124"' + '\n' +
        '  } ],' + '\n' +
        '  "name": "TMF687 Test Product",' + '\n' +
        '  "id": "' + Id.valueOf(product.Id) + '",' + '\n' +
        '  "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(product.Id) + '",' + '\n' +
        '  "description": "TMF687 Test Product Description",' + '\n' +
        '  "@type": "Product"' + '\n' +
        '}';

        TMFProductRefOrValue testedEntity = new TMFProductRefOrValue(orderItem);       
        
        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(testedEntity, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
    }

    @isTest
    static void testEnrichInput() {

        Product2 product = TMF687TestDataFactory.createTestProduct();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Account serviceAccount = TMF687TestDataFactory.createTestServiceAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);

        TMFProductRefOrValue testedEntity = new TMFProductRefOrValue(orderItem); 

        OrderItem enrichedRecord = testedEntity.enrichInput(orderItem);

        //Assert.areEqual(1, enrichedRecord.vlocity_cmt__JSONAttribute__c, 'Expected and actual Quantity do not match');
        Assert.areEqual('TMF687 Test Product', enrichedRecord.Product2.Name, 'Expected and actual Product2Id do not match');
        Assert.areEqual('TMF687 Test Product Description', enrichedRecord.Product2.Description, 'Expected and actual Product2Id do not match');
        //Assert.areEqual(product.Id, enrichedRecord.vlocity_cmt__ServiceAccountId__r.Id, 'Expected and actual Product2Id do not match');
        
    }
}
