/*

Reference: https://datamodel.tmforum.org/en/latest/Product/ProductSpecificationRef/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Product/ProductSpecificationRef.schema.json

Initialized based on:
 - Product2 (referenced from an order line item)

Fields:
 - @referredType: a string. The actual type of the target instance when needed for disambiguation
 - name: a string. Name of the related entity
 - href: an uri (Uri). Hyperlink reference
 - id: a string. unique identifier
 - @baseType: a string. When sub-classing, this defines the super-class
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - targetProductSchema: a target product schema (TargetProductSchema). A target product schema reference. The reference object to the schema and type of target product which is described by product specification
 - version: a string. Version of the product specification

Example:
{
    "id": "14307",
    "href": "https://host:port/productCatalogManagement/v4/productSpecification/14307",
    "name": "Mobile Telephony",
    "version": "1",
    "@type": "ProductSpecification"
}

Notes:
 - n/a

To do:
 - Add test class

*/

public with sharing class TMFProductSpecificationRef {

    String at_baseType;
    String at_referredType;
    String at_schemaLocation;
    String at_type;
    String href;
    String id;
    String name;
    TMFTargetProductSchema targetProductSchema;
    String version;

    public TMFProductSpecificationRef(Product2 product) {
        Product2 enrichedRecord = enrichInput(product);

        this.at_baseType = null; //for future use
        this.at_referredType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = 'ProductSpecification';
        this.href = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.Id;
        this.id = enrichedRecord.Id;
        this.name = enrichedRecord.Name;
        this.targetProductSchema = null; //for future use
        this.version = enrichedRecord.vlocity_cmt__VersionLabel__c;
    }

    public Product2 enrichInput(Product2 product) {
        Product2 enrichedRecord = [
            select 
                Id,
                Name,
                Description,
                vlocity_cmt__VersionLabel__c
            from
                Product2
            where 
                Id = :product.Id
            limit 
                1
        ];

        return enrichedRecord;
    }
}
