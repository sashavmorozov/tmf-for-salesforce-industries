/*

Reference: https://datamodel.tmforum.org/en/latest/Product/RelatedProductOrderItem/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Product/RelatedProductOrderItem.schema.json

Initialized based on:
 - Order line item

Fields:
 - @baseType: a string. When sub-classing, this defines the super-class
 - @referredType: a string. The actual type of the target instance when needed for disambiguation
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - href: an uri (Uri). Hyperlink reference
 - id: a string. unique identifier
 - orderItemAction: a string. Action of the order item for this product
 - orderItemId: a string. Identifier of the order item where the product was managed
 - productOrderHref: a string. Reference of the related entity
 - productOrderId: a string. Unique identifier of a related entity
 - role: a string. role of the product order item for this product

Example:
{
    "@baseType" : null,
    "@referredType" : null,
    "@schemaLocation" : null,
    "@type" : null,
    "href" : "https://demoorg-1617208925628.my.salesforce.com/8020900000YBapNAAT",
    "id" : "8020900000YBapNAAT",
    "orderItemAction" : "Add",
    "orderItemId" : "8020900000YBapNAAT",
    "productOrderHref" : "https://demoorg-1617208925628.my.salesforce.com/8010900000COHQYAA5",
    "productOrderId" : "8010900000COHQYAA5",
    "role" : null
}

Notes:
 - n/a

To do:
 - Add test class

*/

public with sharing class TMFRelatedProductOrderItem {

    String at_baseType;
    String at_referredType;
    String at_schemaLocation;
    String at_type;
    String href;
    String id;
    String orderItemAction;
    String orderItemId;
    String productOrderHref;
    String productOrderId;
    String role;

    public TMFRelatedProductOrderItem(OrderItem orderItem) {

        OrderItem enrichedRecord = enrichInput(orderItem);

        this.at_baseType = null; //for future use
        this.at_referredType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = null; //for future use
        this.href = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.Id;
        this.id = enrichedRecord.Id;
        this.orderItemAction = enrichedRecord.vlocity_cmt__Action__c;
        this.orderItemId = enrichedRecord.Id;
        this.productOrderHref = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.OrderId;
        this.productOrderId = enrichedRecord.OrderId;
        this.role = null; //for future use
    }

    public OrderItem enrichInput(OrderItem orderItem) {
        OrderItem enrichedRecord = [
            select 
                Id,
                vlocity_cmt__Action__c,
                OrderId
            from
                OrderItem
            where 
                Id = :orderItem.Id
            limit 
                1
        ];

        return enrichedRecord;
    }
}
