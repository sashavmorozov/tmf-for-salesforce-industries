/*

Reference: hhttps://datamodel.tmforum.org/en/latest/Common/Quantity/
JSON Schema: https://github.com/tmforum-rand/schemas/blob/candidates/Common/Quantity.schema.json

Initialized based on:
 - Order item fields (not records)

Fields:
 - amount: a float. Numeric value in a given unit
 - units: a string. Unit

Example:
{
    "amount": 1,
    "units": "box"
}

Notes:
 - n/a

To do:
 - Add test class

*/


public with sharing class TMFQuantity {
    Integer amount = 1;
    String units;

    public TMFQuantity(Integer amount, String units) {
        this.amount = amount;
        this.units = units;
    }

    public TMFQuantity(Integer amount) {
        this.amount = amount;
    }

    public TMFQuantity(Decimal amount, String units) {
      this.amount = (Integer) amount;
      this.units = units;
    }

    public TMFQuantity(Decimal amount) {
        this.amount = (Integer) amount;
  }
}
