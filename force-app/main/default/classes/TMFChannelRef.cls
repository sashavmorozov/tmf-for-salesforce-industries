/*

Reference: https://datamodel.tmforum.org/en/latest/Common/ChannelRef/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Common/ChannelRef.schema.json

Initialized based on:
 - Order Item field (not a record)

Fields:
 - @baseType: a string. When sub-classing, this defines the super-class
 - @referredType: a string. The actual type of the target instance when needed for disambiguation
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - href: an uri (Uri). Hyperlink reference
 - id: a string. unique identifier
 - name: a string. Name of the channel

Example:
{
    "id": "11",
    "name": "retail"
}

Notes:
 - n/a

To do:
 - Add test class

*/

public with sharing class TMFChannelRef {

    String at_baseType;
    String at_referredType;
    String at_schemaLocation;
    String at_type;
    String href;
    String id;
    String name;

    public TMFChannelRef(String name) {
        this.at_baseType = null; //for future use
        this.at_referredType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = null; //for future use
        this.href = null; //for future use
        this.id = null; //for future use
        this.name = name; //for future use
    }
}
