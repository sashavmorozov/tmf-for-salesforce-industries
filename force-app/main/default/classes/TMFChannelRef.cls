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

    private String at_baseType;
    private String at_referredType;
    private String at_schemaLocation;
    private String at_type;
    private String href;
    private String id;
    private String name;

    public TMFChannelRef(String name) {
        this.at_baseType = null; //for future use
        this.at_referredType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = null; //for future use
        this.href = null; //for future use
        this.id = null; //for future use
        this.name = name;
    }

    public String getAt_baseType() {
        return at_baseType;
    }

    public void setAt_baseType(String at_baseType) {
        this.at_baseType = at_baseType;
    }

    public String getAt_referredType() {
        return at_referredType;
    }

    public void setAt_referredType(String at_referredType) {
        this.at_referredType = at_referredType;
    }

    public String getAt_schemaLocation() {
        return at_schemaLocation;
    }

    public void setAt_schemaLocation(String at_schemaLocation) {
        this.at_schemaLocation = at_schemaLocation;
    }

    public String getAt_type() {
        return at_type;
    }

    public void setAt_type(String at_type) {
        this.at_type = at_type;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}