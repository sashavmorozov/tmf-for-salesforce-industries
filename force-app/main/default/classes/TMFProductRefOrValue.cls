/*

Reference: https://datamodel.tmforum.org/en/latest/Product/ProductRefOrValue/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Product/ProductRefOrValue.schema.json

Initialized based on:
 - Order Item (for which a reservation is done)

Fields:
 - @baseType: a string. When sub-classing, this defines the super-class
 - @referredType: a string. The actual type of the target instance when needed for disambiguation
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - agreement: a list of agreement item references (AgreementItemRef [*]). Agreement reference. An agreement represents a contract or arrangement, either written or verbal and sometimes enforceable by law, such as a service level agreement or a customer price agreement. An agreement involves a number of other business entities, such as products, services, and resources and/or their specifications
 - billingAccount: a billing account reference (BillingAccountRef). A BillingAccount is a detailed description of a bill structure
 - description: a string. Is the description of the product. It could be copied from the description of the Product Offering
 - href: a string. Reference of the product
 - id: a string. Unique identifier of the product
 - isBundle: a boolean. If true, the product is a ProductBundle which is an instantiation of a BundledProductOffering. If false, the product is a ProductComponent which is an instantiation of a SimpleProductOffering
 - isCustomerVisible: a boolean. If true, the product is visible by the customer
 - name: a string. Name of the product. It could be the same as the name of the product offering
 - orderDate: a date time (DateTime). Is the date when the product was ordered
 - place: a list of related place ref or values (RelatedPlaceRefOrValue [*]). Related Entity reference. A related place defines a place described by reference or by value linked to a specific entity. The polymorphic attributes @type, @schemaLocation & @referredType are related to the place entity and not the RelatedPlaceRefOrValue class itself
 - product: a list of product ref or values (ProductRefOrValue [*]). A product to be created defined by value or existing defined by reference. The polymorphic attributes @type, @schemaLocation & @referredType are related to the product entity and not the RelatedProductRefOrValue class itself
 - productCharacteristic: a list of characteristics (Characteristic [*]). Describes a given characteristic of an object or entity through a name/value pair
 - productOffering: a product offering reference (ProductOfferingRef). A product offering represents entities that are orderable from the provider of the catalog, this resource includes pricing information
 - productOrderItem: a list of related product order items (RelatedProductOrderItem [*]). RelatedProductOrderItem (ProductOrder item) .The product order item which triggered product creation/change/termination
 - productPrice: a list of product prices (ProductPrice [*]). An amount, usually of money, that represents the actual price paid by a Customer for a purchase, a rent or a lease of a Product. The price is valid for a defined period of time
 - productRelationship: a list of product relationships (ProductRelationship [*]). Linked products to the one instantiate, such as [bundled] if the product is a bundle and you want to describe the bundled products inside this bundle; [reliesOn] if the product needs another already owned product to rely on (e.g. an option on an already owned mobile access product) [targets] or [isTargeted] (depending on the way of expressing the link) for any other kind of links that may be useful
 - productSerialNumber: a string. Is the serial number for the product. This is typically applicable to tangible products e.g. Broadband Router
 - productSpecification: a product specification reference (ProductSpecificationRef). A ProductSpecification is a detailed description of a tangible or intangible object made available externally in the form of a ProductOffering to customers or other parties playing a party role
 - productTerm: a list of product terms (ProductTerm [*]). Description of a productTerm linked to this product. This represent a commitment with a duration
 - randomAtt: a string
 - realizingResource: a list of resource references (ResourceRef [*])
 - realizingService: a list of service references (ServiceRef [*]). for when Service is used by other entities
 - relatedParty: a list of related parties (RelatedParty [*]). Related Entity reference. A related party defines party or party role linked to a specific entity
 - startDate: a date time (DateTime). Is the date from which the product starts
 - status: a product status type (ProductStatusType). Is the lifecycle status of the product
 - terminationDate: a date time (DateTime). Is the date when the product was terminated

Example:
{
    "productCharacteristic": [
        {
            "id": "1",
            "valueType": "string",
            "name": "Color",
            "value": "Orange"
        },
        {
            "id": "2",
            "valueType": "string",
            "name": "Memory Size",
            "value": "256 GB"
        }
    ],
    "productSpecification": {
        "id": "23",
        "href": "http://serverlocation:port/productCatalogManagement/v4/productSpecification/23",
        "name": "TMFPhone",
        "version": "x-9",
        "@type": "ProductSpecification"
    },
    "@type": "Product"
}

Notes:
 - n/a

To do:
 - Add test class

*/


public with sharing class TMFProductRefOrValue {

    String at_baseType;
    String at_referredType;
    String at_schemaLocation;
    String at_type;
    List<TMFAgreementItemRef> agreement;
    TMFBillingAccountRef billingAccount;
    String description;
    String href;
    String id;
    Boolean isBundle;
    Boolean isCustomerVisible;
    String name;
    Datetime orderDate;
    List<TMFRelatedPlaceRefOrValue> place;
    List<TMFProductRefOrValue> product;
    List<TMFCharacteristic> productCharacteristic;
    TMFProductOfferingRef productOffering;
    List<TMFRelatedProductOrderItem> productOrderItem;
    List<TMFProductPrice> productPrice;
    List<TMFProductRelationship> productRelationship;
    String productSerialNumber;
    TMFProductSpecificationRef productSpecification;
    List<TMFProductTerm> productTerm;
    List<TMFResourceRef> realizingResource;
    List<TMFServiceRef> realizingService;
    List<TMFRelatedParty> relatedParty;
    Datetime startDate;
    String status;
    Datetime terminationDate;

    public TMFProductRefOrValue() {

    }

    public TMFProductRefOrValue(OrderItem orderItem) {
        
        OrderItem enrichedRecord = enrichInput(orderItem);

        this.at_baseType = null; //for future use
        this.at_referredType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = 'Product';
        this.agreement = null; //for future use
        this.billingAccount = null; //for future use
        this.description = enrichedRecord.Product2.Description;
        this.href = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.Product2Id;
        this.id = enrichedRecord.Product2Id;
        this.isBundle = null; //for future use
        this.isCustomerVisible = null; //for future use
        this.name = enrichedRecord.Product2.Name;
        this.orderDate = null; //for future use

        if (enrichedRecord.vlocity_cmt__ServiceAccountId__c != null) {

            this.place = new List<TMFRelatedPlaceRefOrValue> {
                new TMFRelatedPlaceRefOrValue(new Account(Id = enrichedRecord.vlocity_cmt__ServiceAccountId__c))
            };
        } else {
            this.place = null;
        }

        this.product = null; //for future use
        this.productCharacteristic = getOrderItemCharacteristics(enrichedRecord);
        this.productOffering = null; //for future use

        this.productOrderItem = new List<TMFRelatedProductOrderItem> {
            new TMFRelatedProductOrderItem(enrichedRecord)
        };

        this.productPrice = null; //for future use
        this.productRelationship = null; //for future use
        this.productSerialNumber = null; //for future use

        this.productSpecification = new TMFProductSpecificationRef(
            new Product2(Id = enrichedRecord.Product2Id)
        );

        this.productTerm = null; //for future use
        this.realizingResource = null; //for future use
        this.realizingService = null; //for future use
        this.relatedParty = null; //for future use
        this.startDate = enrichedRecord.vlocity_cmt__RequestDate__c;
        this.status = null; //for future use
        this.terminationDate = null; //for future use

    }

    public OrderItem enrichInput(OrderItem orderItem) {
        OrderItem enrichedRecord = [
            select 
                Id,
                vlocity_cmt__JSONAttribute__c,
                Product2Id,
                Product2.Name,
                Product2.Description,
                vlocity_cmt__RequestDate__c,
                vlocity_cmt__ServiceAccountId__r.Id
            from
                OrderItem
            where 
                Id = :orderItem.Id
            limit 
                1
        ];

        return enrichedRecord;
    }

    public List<TMFCharacteristic> getOrderItemCharacteristics(OrderItem orderItem) {
        List<TMFCharacteristic> characteristics;
        OrderItem oLI = [select Id, vlocity_cmt__JSONAttribute__c from OrderItem where Id = :orderItem.Id];
        String jsonAttrAsString = oLI.vlocity_cmt__JSONAttribute__c; 

        /* prepare data and invoke Vlocity API */
        List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest> actionRequestsList = new List<vlocity_cmt.JSONAttributeSupport.JSONAttributeActionRequest>();
        Map<String, Object> inputMap = new Map<String, Object>(); 
        Map<String, Object> outputMap = new Map<String, Object>(); 
        Map<String, Object> optionsMap = new Map<String, Object>();

        inputMap.put('JSONString', jsonAttrAsString);
        vlocity_cmt.JSONAttributeSupport jsonSupport = new vlocity_cmt.JSONAttributeSupport();
        jsonSupport.invokeMethod('getAttributeValuesFromJSON', inputMap, outputMap, optionsMap); 
        Map<String, Object> attributeCodeToValueMap = (Map<String, Object>) outputMap.get('attributeCodeToValue');
        Map<String, Object> attributeCodeToDisplayNameMap = (Map<String, Object>) outputMap.get('attributeCodeToDisplayName');

        /* access a complete map of line item attributes */
        System.debug('attributeCodeToValueMap: ' + JSON.serializePretty(attributeCodeToValueMap));

        if (attributeCodeToValueMap != null) {
            characteristics = new List<TMFCharacteristic>();
            for (String key : attributeCodeToValueMap.keySet()) {
                TMFCharacteristic c = new TMFCharacteristic(
                    (String) attributeCodeToDisplayNameMap.get(key), 
                    (String) attributeCodeToValueMap.get(key));
                c.setId(key);
                
                if (c.getValue() != null) characteristics.add(c);
            }
        }

        return characteristics;
    }
}