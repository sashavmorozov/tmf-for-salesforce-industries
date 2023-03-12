@isTest
private class TMFRelatedPlaceRefOrValueTest {
    
    @isTest
    static void testTMFRelatedPlaceRefOrValueConstructor() {

        Account serviceAccount = TMF687TestDataFactory.createTestServiceAccount();
        TMFRelatedPlaceRefOrValue relatedPlaceRefOrValue = new TMFRelatedPlaceRefOrValue(serviceAccount);
        Assert.isTrue(true, 'Test for an empty constructor, for future use');
        
    }
}
