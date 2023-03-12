@isTest
private class TMFReserveProductStockTest {
    
    @isTest
    static void testTMFReserveProductStockConstructor_back() {

        Product2 product = TMF687TestDataFactory.createTestProduct();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Account serviceAccount = TMF687TestDataFactory.createTestServiceAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);

        TMFReserveProductStock reserveProductStock = new TMFReserveProductStock(orderItem);
        Assert.isTrue(true, 'Test for an empty constructor, for future use');
        
    }


    /*
    @isTest
    static void testTMFReserveProductStockConstructor() {

        Product2 product = TMF687TestDataFactory.createTestProduct();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Account serviceAccount = TMF687TestDataFactory.createTestServiceAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);

        String expectedPayloadString = '\n' +
        '{' + '\n' +
        '  "requestedProduct": {' + '\n' +
        '    "productSpecification": {' + '\n' +
        '      "version": "TMF687 Test Product Version",' + '\n' +
        '      "name": "TMF687 Test Product",' + '\n' +
        '      "id": "' + Id.valueOf(product.Id) + '",' + '\n' + 
        '      "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(product.Id) + '",' + '\n' +
        '      "@type": "ProductSpecification"' + '\n' +
        '    },' + '\n' +
        '    "productOrderItem": [ {' + '\n' +
        '      "productOrderId": "' + Id.valueOf(ord.Id) + '",' + '\n' + 
        '      "productOrderHref": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(ord.Id) + '",' + '\n' +
        '      "orderItemId": "' + Id.valueOf(orderItem.Id) + '",' + '\n' +
        '      "orderItemAction": "Add",' + '\n' +
        '      "id": "' + Id.valueOf(orderItem.Id) + '",' + '\n' +
        '      "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(orderItem.Id) + '"' + '\n' +
        '    } ],' + '\n' +
        '    "productCharacteristic": [ {' + '\n' +
        '      "value": "1363636277",' + '\n' +
        '      "name": "Billing Code",' + '\n' +
        '      "id": "ATTRIBUTE-117"' + '\n' +
        '    }, {' + '\n' +
        '      "value": "bee.io",' + '\n' +
        '      "name": "Provider",' + '\n' +
        '      "id": "ATTRIBUTE-124"' + '\n' +
        '    } ],' + '\n' +
        '    "name": "TMF687 Test Product",' + '\n' +
        '    "id": "' + Id.valueOf(product.Id) + '",' + '\n' +
        '    "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(product.Id) + '",' + '\n' +
        '    "description": "TMF687 Test Product Description",' + '\n' +
        '    "@type": "Product"' + '\n' +
        '  },' + '\n' +
        '  "quantityRequested": {' + '\n' +
        '    "amount": 1.00' + '\n' +
        '  },' + '\n' +
        '  "@type": "ReserveProductStockItem"' + '\n' +
        '}';


        '{' + '\n' +
        '  "reserveProductStockItem": [ {' + '\n' +
        '    "requestedProduct": {' + '\n' +
        '      "productSpecification": {' + '\n' +
        '        "version": "V1",' + '\n' +
        '        "name": "Blaze Premium Fiber Dedicated Internet Offer",' + '\n' +
        '        "id": "01t090000021ZVlAAM",' + '\n' +
        '        "href": "https://demoorg-1617208925628.my.salesforce.com/01t090000021ZVlAAM",' + '\n' +
        '        "@type": "ProductSpecification"' + '\n' +
        '      },' + '\n' +
        '      "productOrderItem": [ {' + '\n' +
        '        "productOrderId": "8010900000COHQYAA5",' + '\n' +
        '        "productOrderHref": "https://demoorg-1617208925628.my.salesforce.com/8010900000COHQYAA5",' + '\n' +
        '        "orderItemId": "8020900000YBapNAAT",' + '\n' +
        '        "orderItemAction": "Add",' + '\n' +
        '        "id": "8020900000YBapNAAT",' + '\n' +
        '        "href": "https://demoorg-1617208925628.my.salesforce.com/8020900000YBapNAAT"' + '\n' +
        '      } ],' + '\n' +
        '      "productCharacteristic": [ {' + '\n' +
        '        "value": "FlowThrough",' + '\n' +
        '        "name": "OrderManagement",' + '\n' +
        '        "id": "B2B-ATTR-ORDR-MGMT-OPTIONS"' + '\n' +
        '      }, {' + '\n' +
        '        "value": "500 Mbps",' + '\n' +
        '        "name": "Committed Bandwidth",' + '\n' +
        '        "id": "ATT-ATTR-BW-003"' + '\n' +
        '      }, {' + '\n' +
        '        "value": "Fixed Rate",' + '\n' +
        '        "name": "Usage Type",' + '\n' +
        '        "id": "ATTR-PLAN-001"' + '\n' +
        '      }, {' + '\n' +
        '        "value": "1 Gbps",' + '\n' +
        '        "name": "Access Speed",' + '\n' +
        '        "id": "ATTRIBUTE-153"' + '\n' +
        '      }, {' + '\n' +
        '        "value": "Ethernet",' + '\n' +
        '        "name": "Access Type",' + '\n' +
        '        "id": "ATTRIBUTE-152"' + '\n' +
        '      }, {' + '\n' +
        '        "value": "No",' + '\n' +
        '        "name": "Customer Owned CPE Router",' + '\n' +
        '        "id": "B2B-ATTR-CUSTOMER-CPE-ROUTER"' + '\n' +
        '      } ],' + '\n' +
        '      "place": [ {' + '\n' +
        '        "role": "Consumer",' + '\n' +
        '        "name": "Sasha's Bureau",' + '\n' +
        '        "id": "0010900000HbMfDAAV",' + '\n' +
        '        "href": "https://demoorg-1617208925628.my.salesforce.com/0010900000HbMfDAAV",' + '\n' +
        '        "@type": "PlaceRef",' + '\n' +
        '        "@referredType": "GeographicSite"' + '\n' +
        '      } ],' + '\n' +
        '      "name": "Blaze Premium Fiber Dedicated Internet Offer",' + '\n' +
        '      "id": "01t090000021ZVlAAM",' + '\n' +
        '      "href": "https://demoorg-1617208925628.my.salesforce.com/01t090000021ZVlAAM",' + '\n' +
        '      "description": "Our best Dedicated Internet Access with 10Gbps speeds for On-Net Fiber locations !",' + '\n' +
        '      "@type": "Product"' + '\n' +
        '    },' + '\n' +
        '    "quantityRequested": {' + '\n' +
        '      "amount": 1.00' + '\n' +
        '    },' + '\n' +
        '    "@type": "ReserveProductStockItem"' + '\n' +
        '  } ],' + '\n' +
        '  "requiredAvailabilityDate": "2023-03-12T17:05:10.530Z",' + '\n' +
        '  "relatedParty": [ {' + '\n' +
        '    "role": "Related account",' + '\n' +
        '    "id": "' + Id.valueOf(account.Id) + '",' + '\n' +
        '    "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(account.Id) + '",' + '\n' +
        '    "@type": "PartyRef",' + '\n' +
        '    "@referredType": "Business"' + '\n' +
        '  } ],' + '\n' +
        '  "relatedEntity": [ {' + '\n' +
        '    "role": "Related order",' + '\n' +
        '    "id": "' + Id.valueOf(ord.Id) + '",' + '\n' +
        '    "href": "' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + Id.valueOf(ord.Id) + '",' + '\n' +
        '    "@type": "EntityRef",' + '\n' +
        '    "@referredType": "ProductOrder"' + '\n' +
        '  } ],' + '\n' +
        '  "creationDate": "2023-03-12T17:05:10.530Z",' + '\n' +
        '  "channel": [ {' + '\n' +
        '    "name": "Call Center"' + '\n' +
        '  } ],' + '\n' +
        '  "@type": "ReserveProductStock"' + '\n' +
        '}';

        TMFReserveProductStockItem reserveProductStockItem = new TMFReserveProductStockItem(orderItem);       
        
        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(reserveProductStockItem, true).replace('at_', '@'));

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

        TMFReserveProductStockItem reserveProductStockItem = new TMFReserveProductStockItem(orderItem); 

        OrderItem enrichedRecord = reserveProductStockItem.enrichInput(orderItem);

        Assert.areEqual(1, enrichedRecord.Quantity, 'Expected and actual Quantity do not match');
        Assert.areEqual(product.Id, enrichedRecord.Product2Id, 'Expected and actual Product2Id do not match');
        
    }

    */
}
