@isTest
private class TMFChannelRefTest {
    
    @isTest
    static void testTMFChannelRefConstructor() {

        String expectedPayloadString = '\n' +
        '{' + '\n' +
            '"@baseType" : "BaseType",' + '\n' +
            '"@referredType" : "ReferredType",' + '\n' +
            '"@schemaLocation" : "https://github.com/tmforum-rand/schemas/test.schema.json",' + '\n' +
            '"@type" : "Type",' + '\n' +
            '"href" : "https://server:port/channels/1",' + '\n' +
            '"id" : "1",' + '\n' +
            '"name" : "retail"' + '\n' +
        '}';

        TMFChannelRef channelRef = new TMFChannelRef('retail');        
        channelRef.setAt_baseType('BaseType');
        channelRef.setAt_referredType('ReferredType');
        channelRef.setAt_schemaLocation('https://github.com/tmforum-rand/schemas/test.schema.json');
        channelRef.setAt_type('Type');
        channelRef.setHref('https://server:port/channels/1');
        channelRef.setId('1');
        channelRef.setName('retail');

        Object expectedPayloadMap = JSON.deserializeUntyped(expectedPayloadString);
        Object actualPayloadMap = JSON.deserializeUntyped(JSON.serializePretty(channelRef, true).replace('at_', '@'));

        Assert.areEqual(expectedPayloadMap, actualPayloadMap, 'Expected and actual payloads do not match');
    }

    @isTest 
    static void testGettersAndSetters() {
        // Test that the getters and setters work correctly
        TMFChannelRef channelRef = new TMFChannelRef('retail');
        
        channelRef.setAt_baseType('BaseType');
        Assert.areEqual('BaseType', channelRef.getAt_baseType());

        channelRef.setAt_referredType('ReferredType');
        Assert.areEqual('ReferredType', channelRef.getAt_referredType());

        channelRef.setAt_schemaLocation('https://github.com/tmforum-rand/schemas/test.schema.json');
        Assert.areEqual('https://github.com/tmforum-rand/schemas/test.schema.json', channelRef.getAt_schemaLocation());

        channelRef.setAt_type('Type');
        Assert.areEqual('Type', channelRef.getAt_type());

        channelRef.setHref('https://server:port/channels/1');
        Assert.areEqual('https://server:port/channels/1', channelRef.getHref());

        channelRef.setId('1');
        Assert.areEqual('1', channelRef.getId());

        channelRef.setName('retail');
        Assert.areEqual('retail', channelRef.getName());
        
        
    }
}
