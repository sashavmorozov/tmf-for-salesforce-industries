/*

Reference: https://datamodel.tmforum.org/en/latest/EngagedParty/RelatedParty/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/EngagedParty/RelatedParty.schema.json

Initialized based on:
 - Account (customer account linked with an order line item)

Fields:
 - @baseType: a string. When sub-classing, this defines the super-class
 - @referredType: a string. The actual type of the target instance when needed for disambiguation
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - href: an uri (Uri). Hyperlink reference
 - id: a string. unique identifier
 - name: a string. Name of the related entity
 - role: a string. Role played by the related party

Example:
{
    "@referredType": "Individual"
    "@type": "PartyRef",
    "href": "http://serverlocation:port/partyManagement/v4/individual/45",
    "id": "45",
    "role": "requester",
}

Notes:
 - n/a

To do:
 - Add test class

*/

public with sharing class TMFRelatedParty {
   
    String at_referredType;
    String at_type;
    String href;
    String id;
    String role;

    public TMFRelatedParty(Account account) {

        Account enrichedRecord = enrichInput(account);

        this.at_referredType = enrichedRecord.RecordType.DeveloperName;
        this.at_type = 'PartyRef';
        this.href = URL.getSalesforceBaseUrl().toExternalForm() + '/' + enrichedRecord.Id;
        this.id = enrichedRecord.Id;
        this.role = 'Related account';
    }

    public Account enrichInput(Account account) {
        Account enrichedRecord = [
            select 
                Id,
                Name,
                RecordType.DeveloperName
            from
                Account
            where 
                Id = :account.Id
            limit 
                1
        ];

        return enrichedRecord;
    }
}