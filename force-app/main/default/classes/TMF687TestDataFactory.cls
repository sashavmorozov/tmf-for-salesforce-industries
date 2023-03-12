@isTest
public class TMF687TestDataFactory {
    public static void createTestData() {
        Product2 product = createTestProduct();
        //Pricebook2 pricebook = createTestStandardPricebook();
        PricebookEntry pricebookEntry = createTestStandardPricebookEntry(product);
        Account customerAccount = createTestCustomerAccount();
        Order ord = createTestOrder(customerAccount);
        OrderItem orderItem = createTestOrderItem(ord, product);
    
    }

    public static Product2 createTestProduct() {
        Product2 product = new Product2();
        product.Name = 'TMF687 Test Product';
        product.Description = 'TMF687 Test Product Description';
        product.ProductCode = 'TMF687_TEST_PRODUCT';
        product.IsActive = true;

        product.vlocity_cmt__VersionLabel__c = 'TMF687 Test Product Version';

        product.vlocity_cmt__JSONAttribute__c = '{"VLO-PRO-0008":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t090000021ZVmAAM","attributeid__c":"a0J090000019X33EAE","attributecategoryid__c":"a0I0900000117JxEAI","categorycode__c":"VLO-PRO-0008","categoryname__c":"Installation","attributeuniquecode__c":"ATTRIBUTE-079","attributeconfigurable__c":true,"attributedisplaysequence__c":"4","attributefilterable__c":false,"isactive__c":true,"attributedisplayname__c":"Users","displaysequence__c":"16","formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":false,"valueinnumber__c":null,"objecttype__c":"Product2","querycode__c":null,"isreadonly__c":false,"isquerydriven__c":false,"querylabel__c":null,"id":"a0H090000022WbBEAU","isrequired__c":false,"rulemessage__c":null,"uidisplaytype__c":null,"value__c":null,"valuedatatype__c":null,"valuedescription__c":null,"attributecloneable__c":false,"customconfiguitemplate__c":null,"categorydisplaysequence__c":16,"isnottranslatable__c":false,"attributegrouptype__c":null,"attributeRunTimeInfo":{"dataType":null,"value":"250"},"$$AttributeDefinitionEnd$$":null}],"VLO-PRO-0014":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t090000021ZVmAAM","attributeid__c":"a0J090000019X3bEAE","attributecategoryid__c":"a0I0900000117K4EAI","categorycode__c":"VLO-PRO-0014","categoryname__c":"Billing","attributeuniquecode__c":"ATTRIBUTE-117","attributeconfigurable__c":true,"attributedisplaysequence__c":"1","attributefilterable__c":true,"isactive__c":true,"attributedisplayname__c":"Billing Code","displaysequence__c":"null","formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":false,"valueinnumber__c":null,"objecttype__c":"Product2","querycode__c":null,"isreadonly__c":false,"isquerydriven__c":false,"querylabel__c":null,"id":"a0H090000022WsMEAU","isrequired__c":false,"rulemessage__c":null,"uidisplaytype__c":null,"value__c":null,"valuedatatype__c":"Text","valuedescription__c":null,"attributecloneable__c":false,"customconfiguitemplate__c":null,"categorydisplaysequence__c":22,"isnottranslatable__c":false,"attributegrouptype__c":null,"attributeRunTimeInfo":{"dataType":"Text","value":"1363636277"},"$$AttributeDefinitionEnd$$":null}],"VLO-PRO-0015":[{"$$AttributeDefinitionStart$$":null,"objectid__c":"01t090000021ZVmAAM","attributeid__c":"a0J090000019X3iEAE","attributecategoryid__c":"a0I0900000117K5EAI","categorycode__c":"VLO-PRO-0015","categoryname__c":"Logistics","attributeuniquecode__c":"ATTRIBUTE-124","attributeconfigurable__c":true,"attributedisplaysequence__c":"4","attributefilterable__c":true,"isactive__c":true,"attributedisplayname__c":"Provider","displaysequence__c":"23","formatmask__c":null,"hasrule__c":false,"isconfigurable__c":false,"ishidden__c":false,"valueinnumber__c":null,"objecttype__c":"Product2","querycode__c":null,"isreadonly__c":false,"isquerydriven__c":false,"querylabel__c":null,"id":"a0H090000022WioEAE","isrequired__c":false,"rulemessage__c":null,"uidisplaytype__c":"Text","value__c":null,"valuedatatype__c":"Text","valuedescription__c":null,"attributecloneable__c":false,"customconfiguitemplate__c":null,"categorydisplaysequence__c":23,"isnottranslatable__c":false,"attributegrouptype__c":null,"attributeRunTimeInfo":{"dataType":"Text","uiDisplayType":"Text","value":"bee.io"},"$$AttributeDefinitionEnd$$":null}]}';
        insert product;
        return product;
    }

    public static Account createTestCustomerAccount() {
        Id businessAccountRecordTypeId =  Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();
        Account account = new Account();
        account.Name = 'TMF687 Test Customer Account - Business';
        account.RecordTypeId = businessAccountRecordTypeId;

        insert account;
        return account;
    }
    
    public static Account createTestServiceAccount() {
        Id serviceAccountRecordTypeId =  Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Service').getRecordTypeId();
        Account account = new Account();
        account.Name = 'TMF687 Test Customer Account - Service';
        account.RecordTypeId = serviceAccountRecordTypeId;

        insert account;
        return account;
    }

    public static Order createTestOrder(Account account) {
        Order ord = new Order();
        
        ord.vlocity_cmt__OriginatingChannel__c = 'Digital';
        ord.Name = 'TMF687 Test Order';
        ord.AccountId = account.Id; //'0010900000EQbFLAA1';
        ord.EffectiveDate = Date.newInstance(2023, 2, 23);
        ord.Status = 'Draft';
        ord.Pricebook2Id = Test.getStandardPricebookId();

        insert ord;        
        return ord;

    }

    public static OrderItem createTestOrderItem(Order parentOrder, Product2 product) {
        OrderItem orderItem = new OrderItem();
        
        orderItem.OrderId = parentOrder.Id;
        orderItem.Product2Id = product.Id;
        orderItem.vlocity_cmt__Action__c = 'Add';
        orderItem.vlocity_cmt__JSONAttribute__c = product.vlocity_cmt__JSONAttribute__c;
        orderItem.vlocity_cmt__ServiceAccountId__c = null; //for future use
        orderItem.Quantity = 1;
        orderItem.PricebookEntryId = getStandardPricebookEntry(product).Id;
        orderItem.UnitPrice = 100; //standardPricebookEntry.UnitPrice;

        insert orderItem;
        return orderItem;

    }

/*     public static Pricebook2 createTestStandardPricebook() {
        
/*         Pricebook2 pricebook = new Pricebook2();
        pricebook.Name = 'TMF687 Test Standard Pricebook';
        pricebook.Description = 'TMF687 Test Standard Pricebook';
        pricebook.isStandard = true;
        pricebook.IsActive = true;
 */
/*         Id pricebookId = Test.getStandardPricebookId();
        Pricebook2 standardPricebook = new Pricebook2(
            Id = pricebookId,
            IsActive = true
        );
        update standardPricebook;
        return standardPricebook; 
    } */

    public static PricebookEntry createTestStandardPricebookEntry(Product2 product) {

        /* Pricebook2 standardPricebook = [
            SELECT Id
            FROM Pricebook2
            WHERE isStandard = true
            LIMIT 1
        ]; */

        PricebookEntry standardPricebookEntry = new PricebookEntry();
        standardPricebookEntry.Pricebook2Id = Test.getStandardPricebookId();  //standardPricebook.Id;
        standardPricebookEntry.Product2Id = product.Id;
        standardPricebookEntry.UnitPrice = 100.00;
        standardPricebookEntry.UseStandardPrice = false;
        standardPricebookEntry.IsActive = true;
    
        insert standardPricebookEntry;
        return standardPricebookEntry;
    }

    public static PricebookEntry createTestPricebookEntry(Pricebook2 pricebook, Product2 product) {
        PricebookEntry pricebookEntry = new PricebookEntry();
        pricebookEntry.Pricebook2Id = pricebook.Id;
        pricebookEntry.Product2Id = product.Id;
        pricebookEntry.UnitPrice = 100.00;
        pricebookEntry.UseStandardPrice = false;
        pricebookEntry.IsActive = true;
    
        insert priceBookEntry;
        return priceBookEntry;
    }

/*     public static Pricebook2 getStandardPricebook() {
        Pricebook2 standardPricebook = new Pricebook2

        return standardPricebook;
    } */

    public static PricebookEntry getStandardPricebookEntry(Product2 product) {
        PricebookEntry standardPricebookEntry = [
            SELECT 
                Id
            FROM 
                PricebookEntry
            WHERE 
                Pricebook2Id = :Test.getStandardPricebookId()
                AND Product2Id = :product.Id
            LIMIT 1
        ];

        return standardPricebookEntry;
    }

}