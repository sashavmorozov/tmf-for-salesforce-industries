@isTest
private class TMFQuantityTest {
    
    @isTest
    static void testTMFQuantityConstructor() {
        

        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"amount": 1,' + '\n' +
            '"units": "box"' + '\n' +
        '}';

        TMFQuantity quantity = new TMFQuantity(1, 'box');
        
        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(quantity, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
    }
    
    @isTest
    static void testTMFQuantityConstructorSetGet() {
        TMFQuantity quantity1 = new TMFQuantity(1, 'box');
        Assert.areEqual(1, quantity1.getAmount());
        Assert.areEqual('box', quantity1.getUnits());

        TMFQuantity quantity2 = new TMFQuantity(100);
        Assert.areEqual(100, quantity2.getAmount());
        
        TMFQuantity quantity3 = new TMFQuantity(1.5, 'kg');
        Assert.areEqual(1.5, quantity3.getAmount());
        Assert.areEqual('kg', quantity3.getUnits());

        TMFQuantity quantity4 = new TMFQuantity(2.567);
        Assert.areEqual(2.567, quantity4.getAmount());
    }
}
