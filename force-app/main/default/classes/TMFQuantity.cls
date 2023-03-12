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

*/


public with sharing class TMFQuantity {
    Decimal amount = 1;
    String units;

    public TMFQuantity(Decimal amount, String units) {
      this.amount = amount;
      this.units = units;
    }

    public TMFQuantity(Decimal amount) {
        this.amount = amount;
    }

    public Decimal getAmount() {
        return this.amount;
    }

    public String getUnits() {
        return this.units;
    }

    public void setAmount(Decimal amount) {
        this.amount = amount;
    }

    public void setUnits() {
        this.units = units;
    }
}
