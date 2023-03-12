@isTest
private class TMFCharacteristicTest {
    
    @isTest
    static void testTMFCharacteristicConstructor() {

        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"id" : "Test Id",' + '\n' +
            '"name" : "Test Name",' + '\n' +
            '"value" : "Test Value"' + '\n' +
        '}';

        TMFCharacteristic characteristic = new TMFCharacteristic('Test Name', 'Test Value');        
        characteristic.setId('Test Id');

        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(characteristic, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
    }

    @isTest 
    static void testGettersAndSetters() {
        // Test that the getters and setters work correctly
        TMFCharacteristic characteristic = new TMFCharacteristic('Default Name', 'Default Value');        
        
        characteristic.setId('Test Id');
        Assert.areEqual('Test Id', characteristic.getId());

        characteristic.setName('Test Name');
        Assert.areEqual('Test Name', characteristic.getName());

        characteristic.setValue('Test Value');
        Assert.areEqual('Test Value', characteristic.getValue());        
    }
}
