/*

Reference: https://datamodel.tmforum.org/en/latest/Common/RelatedPlaceRefOrValue/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Common/RelatedPlaceRefOrValue.schema.json

Initialized based on:
 - Account (service account linked with an order line item)

Fields:
 - @baseType: A string. When sub-classing, this defines the super-class
 - @referredType: A string. The actual type of the target instance when needed for disambiguation
 - @schemaLocation: An uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: A string. When sub-classing, this defines the sub-class Extensible name
 - href: A string. Unique reference of the place
 - id: A string. Unique identifier of the place
 - name: A string. A user-friendly name for the place, such as [Paris Store], [London Store], [Main Home]
 - role: A string

Example:
{
    "id": "89",
    "href": "http://serverlocation:port/geographicSiteManagement/v4/geographicSite/89",
    "role": "Lyon Shop",
    "@type": "PlaceRef",
    "@referredType": "GeographicSite"
}

Notes:
 - This implementation uses Salesforce Industry Service Accounts
 - This implementation does not support Salesforce Industry Premises yet. Feel free to extend

To do:
 - Add test class

*/


public with sharing class TMFRelatedPlaceRefOrValue {

    String at_baseType;
    String at_referredType;
    String at_schemaLocation;
    String at_type;
    String href;
    String id;
    String name;
    String role;

    public TMFRelatedPlaceRefOrValue(Account serviceAccount) {

        Account enrichedRecord = enrichInput(serviceAccount);

        this.at_baseType = null; //for future use
        this.at_referredType = 'GeographicSite';
        this.at_schemaLocation = null; //for future use
        this.at_type = 'PlaceRef';
        this.href = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.Id;
        this.id = enrichedRecord.Id;
        this.name = enrichedRecord.Name;
        this.role = enrichedRecord.RecordType.DeveloperName;
    }

    public Account enrichInput(Account serviceAccount) {
        Account enrichedRecord = [
            select 
                Id,
                Name,
                RecordType.DeveloperName
            from
                Account
            where 
                Id = :serviceAccount.Id
            limit 
                1
        ];

        return enrichedRecord;
    }
}
