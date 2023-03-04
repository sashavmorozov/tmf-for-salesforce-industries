/*

Reference: https://datamodel.tmforum.org/en/latest/Common/Characteristic/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Common/Characteristic.schema.json

Initialized based on:
 - Order Item (for which a reservation is done)

Fields:
 - @baseType: a string. When sub-classing,\tA this defines the super-class
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - characteristicRelationship: a list of characteristic relationships (CharacteristicRelationship [*]). Another Characteristic that is related to the current Characteristic
 - id: a string. Unique identifier of the characteristic
 - name: a string. Name of the characteristic
 - value: an any (Any). The value of the characteristic
 - valueType: a string. Data type of the value of the characteristic

Example:
{
    "id": "1",
    "valueType": "string",
    "name": "Color",
    "value": "Orange"
} 

Notes:
 - n/a

To do:
 - Add test class

*/

/**
The TMFCharacteristic class represents a characteristic that can be associated with a product or service.
It contains information about the characteristic's name, value, and ID.
The class also provides methods for getting and setting the characteristic's ID, name, and value.
*/

public with sharing class TMFCharacteristic {

    // Class variables
    String at_baseType;
    String at_schemaLocation;
    String at_type;
    List<TMFCharacteristicRelationship> characteristicRelationship;
    String id;
    String name;
    Object value;
    String valueType;

    /**
    Constructor for creating a new instance of the TMFCharacteristic class.
    @param name The name of the characteristic.
    @param value The value of the characteristic.
    */
    public TMFCharacteristic(String name, Object value) {
        this.at_baseType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = null; //for future use
        this.characteristicRelationship = null; //for future use
        this.id = null; //for future use
        this.name = name;
        this.value = value;
        this.valueType = null; //for future use
    }

    /**
    Getter method for the ID of the characteristic.
    @return The ID of the characteristic.
    */
    public String getId() {
        return this.id;
    }
    
    /**
    Getter method for the name of the characteristic.
    @return The name of the characteristic.
    */
    public String getName() {
        return this.name;
    }

    /**

Getter method for the value of the characteristic.
@return The value of the characteristic.
*/
    public Object getValue() {
        return this.value;
    }

    /**
    Setter method for the ID of the characteristic.
    @param id The ID to set for the characteristic.
    */
    public void setId(String id) {
        this.id = id;
    }

    /**
    Setter method for the name of the characteristic.
    @param name The name to set for the characteristic.
    */
    public void setName(String name) {
        this.name = name;
    }

    /**
    Setter method for the value of the characteristic.
    @param value The value to set for the characteristic.
    */
    public void setValue(Object value) {
        this.value = value;
    }
}


