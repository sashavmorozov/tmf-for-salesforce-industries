@isTest
private class TMFRelatedProductOrderItemTest {
    
    @isTest
    static void testTMFRelatedProductOrderItemConstructor() {

        Product2 product = TMF687TestDataFactory.createTestProduct();
        //Pricebook2 pricebook = TMF687TestDataFactory.createTestStandardPricebook();
        PricebookEntry pricebookEntry = TMF687TestDataFactory.createTestStandardPricebookEntry(product);
        Account customerAccount = TMF687TestDataFactory.createTestCustomerAccount();
        Order ord = TMF687TestDataFactory.createTestOrder(customerAccount);
        OrderItem orderItem = TMF687TestDataFactory.createTestOrderItem(ord, product);

        TMFRelatedProductOrderItem relatedProductOrderItem = new TMFRelatedProductOrderItem(orderItem);
        Assert.isTrue(true, 'Test for an empty constructor, for future use');
        
    }
}
