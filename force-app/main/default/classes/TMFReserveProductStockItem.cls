/*

Reference: -
JSON Schema: https://github.com/tmforum-apis/TMF687_StockManagement/blob/master/TMF687-Stock-v4.0.0.swagger.json

Initialized based on:
 - Order Item (for which a reservation is done)

Fields:
 - @baseType: a string. When sub-classing, this defines the super-class
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - id: a string. Unique identifier of the ReserveProductStockItem
 - productStockRequested: a product stock reference (ProductStockRef). Identifier of the Product Stock requested for this reservation item
 - productStockReserved: a product stock reference (ProductStockRef). Identifier of the Product Stock used for this reservation item
 - quantityRequested: a quantity (Quantity). Quantity requested for this Product
 - quantityReserved: a quantity (Quantity). Quantity reserved for this Product
 - requestedProduct: a product ref or value (ProductRefOrValue). Requested product for reservation - a Product configuration could be passed
 - reserveProductStockState: a task state type (TaskStateType). State of the ReserveProductStockItem (acknowledged, inProgress, failed, done, cancelled)

Example:
{
    "id": "1",
    "productStockReserved": {
        "id": "43",
        "href": "http://serverlocation:port/stockManagement/v4/productStock/43",
        "@type": "ProductStockRef"
    },
    "quantityRequested": {
        "amount": 1,
        "units": "box"
    },
    "quantityReserved": {
        "amount": 1,
        "units": "box"
    },
    "requestedProduct": {
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
    },
    "reserveProductStockState": "accepted",
    "@type": "ReserveProductStockItem"
}

Notes:
 - n/a

To do:
 - Add test class

*/



public with sharing class TMFReserveProductStockItem {

    String at_baseType;
    String at_schemaLocation;
    String at_type;
    String id;
    TMFProductStockRef productStockRequested;
    TMFProductStockRef productStockReserved;
    TMFQuantity quantityRequested;
    TMFQuantity quantityReserved;
    TMFProductRefOrValue requestedProduct;
    String reserveProductStockState;

    public TMFReserveProductStockItem(OrderItem orderItem) {
        OrderItem enrichedRecord = enrichInput(orderItem);

        this.at_baseType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = 'ReserveProductStockItem';
        this.id = null; //to be provided in the response by the server
        this.productStockRequested = null; //for future use
        this.productStockReserved = null; //to be provided in the response by the server
        this.quantityRequested = new TMFQuantity(enrichedRecord.Quantity);
        this.quantityReserved = null; //to be provided in the response by the server
        this.requestedProduct = new TMFProductRefOrValue(enrichedRecord);
        this.reserveProductStockState = null; //to be provided in the response by the server 
    }

    public OrderItem enrichInput(OrderItem orderItem) {
        OrderItem enrichedRecord = [
            select 
                Id,
                Quantity,
                Product2Id
            from
                OrderItem
            where 
                Id = :orderItem.Id
            limit 
                1
        ];

        return enrichedRecord;
    }
}
