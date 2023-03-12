/*

Reference: https://datamodel.tmforum.org/en/latest/Common/RelatedEntity/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Common/RelatedEntity.schema.json

Initialized based on:
 - Order (for which a reservation is performed)

Fields:
 - @baseType: a string. When sub-classing, this defines the super-class
 - @referredType: a string. The actual type of the target instance when needed for disambiguation
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - href: an uri (Uri). Hyperlink reference
 - id: a string. unique identifier
 - name: a string. Name of the related entity
 - role: a string. The role of an entity

Example:
{
  "@referredType": "ProductOrder",
  "@type": "EntityRef",
  "href": "http://serverlocation:port/productOrderManagement/v4/productOrder/56",
  "id": "56",
  "name": "Order 1283",
  "role": "order triggering the reservation"
}

Notes:
 - n/a

To do:
 - Add test class

*/


public with sharing class TMFRelatedEntity {

    String at_baseType; 
    String at_referredType; 
    String at_schemaLocation; 
    String at_type; 
    String href; 
    String id; 
    String name; 
    String role; 

    public TMFRelatedEntity(Order order) {

        Order enrichedRecord = enrichInput(order);

        this.at_baseType = null; //for future use 
        this.at_referredType = 'ProductOrder'; 
        this.at_schemaLocation = null; //for future use 
        this.at_type = 'EntityRef';
        this.href = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.Id;
        this.id = enrichedRecord.Id; 
        this.name = enrichedRecord.Name; 
        this.role = 'Related order'; 
    }

    public Order enrichInput(Order o) {
        Order enrichedOrder = [
            select 
                Id,
                Name
            from
                Order
            where 
                Id = :o.Id
            limit 
                1
        ];

        return enrichedOrder;
    }
}
