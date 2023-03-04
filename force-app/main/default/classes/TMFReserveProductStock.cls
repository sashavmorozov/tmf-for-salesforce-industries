/*

Reference: -
JSON Schema: https://github.com/tmforum-apis/TMF687_StockManagement/blob/master/TMF687-Stock-v4.0.0.swagger.json

Initialized based on:
 - Order line item (for which reservation is requested)

Fields:
 - @baseType: a string. When sub-classin.$g, this defines the super-class
 - @schemaLocation: an uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships
 - @type: a string. When sub-classing, this defines the sub-class Extensible name
 - channel: a list of channel references (ChannelRef [*]). Channel(s) beneficiary(ies) for this reservation
 - creationDate: a date time (DateTime). Date when the ReserveProductStock was created (whatever its status)
 - href: a string. Reference of the ReserveProductStock
 - id: a string. Unique identifier of the ReserveProductStock
 - marketSegment: a list of market segment references (MarketSegmentRef [*]). Market segment(s) beneficiary(ies) for this reservation
 - place: a related place ref or value (RelatedPlaceRefOrValue). Used to define a place where the product stock must be reserved
 - relatedEntity: a list of related entities (RelatedEntity [*]). A list of related  entity in relationship with this stock reservation (trouble ticket, quote, product order, etc...)
 - relatedParty: a list of related parties (RelatedParty [*]). A list of related party references (RelatedParty [*]). A related party defines party or party role linked to a specific entity
 - requiredAvailabilityDate: a date time (DateTime). Requested product availability date for the reservation
 - reserveProductStockItem: a list of reserve product stock items (ReserveProductStockItem [*]). A list of product stock item reservation
 - reserveProductStockState: a task state type (TaskStateType). State of the ReserveProductStock (acknowledged, inProgress, failed, done, cancelled)
 - validFor: a time period. Reservation validity period

Example:
{
    "id": "87",
    "href": "http://serverlocation:port/stockManagement/v4/reserveProductStock/87",
    "creationDate": "2020-09-24T10:12:23.664Z",
    "requiredAvailabilityDate": "2020-09-25T10:12:23.664Z",
    "channel": [
        {
            "id": "11",
            "name": "retail"
        }
    ],
    "place": {
        "id": "89",
        "href": "http://serverlocation:port/geographicSiteManagement/v4/geographicSite/89",
        "role": "Lyon Shop",
        "@type": "PlaceRef",
        "@referredType": "GeographicSite"
    },
    "relatedEntity": [
        {
            "id": "56",
            "href": "http://serverlocation:port/productOrderManagement/v4/productOrder/56",
            "role": "order triggering the reservation",
            "@type": "EntityRef",
            "@referredType": "ProductOrder"
        }
    ],
    "relatedParty": [
        {
            "id": "45",
            "href": "http://serverlocation:port/partyManagement/v4/individual/45",
            "role": "requester",
            "@type": "PartyRef",
            "@referredType": "Individual"
        }
    ],
    "reserveProductStockItem": [
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
    ],
    "reserveProductStockState": "accepted",
    "validFor": {
        "endDateTime": "2020-09-24T23:20:50.52Z",
        "startDateTime": "2020-09-26T23:20:50.52Z",
        "@type": "TimePeriod"
    },
    "@type": "ReserveProductStock"
}

Notes:
 - n/a

To do:
 - Add test class

*/


public with sharing class TMFReserveProductStock {

    String at_baseType;
    String at_schemaLocation;
    String at_type;
    List<TMFChannelRef> channel;
    Datetime creationDate;
    String href;
    String id;
    List<TMFMarketSegmentRef> marketSegment;
    List<TMFRelatedPlaceRefOrValue> place;
    List<TMFRelatedEntity> relatedEntity;
    List<TMFRelatedParty> relatedParty;
    Datetime requiredAvailabilityDate;
    List<TMFReserveProductStockItem> reserveProductStockItem;
    String reserveProductStockState;
    TMFTimePeriod validFor;

    public TMFReserveProductStock(OrderItem orderItem) {

        OrderItem enrichedRecord = enrichInput(orderItem);

        this.at_baseType = null; //for future use
        this.at_schemaLocation = null; //for future use
        this.at_type = 'ReserveProductStock'; //for future use

        if (enrichedRecord.Order.vlocity_cmt__OriginatingChannel__c != null) {
            this.channel = new List<TMFChannelRef> {
                new TMFChannelRef(enrichedRecord.Order.vlocity_cmt__OriginatingChannel__c)
            };
        }

        this.creationDate = System.now();
        this.href = null; //Generated by the server and provided in  the response upon resource creation
        this.id = null; //Generated by the server and provided in  the response upon resource creation
        this.marketSegment = null; //for future use
        this.place = null; //for future use

        if (enrichedRecord.Order != null) {
            this.relatedEntity = new List<TMFRelatedEntity> {
                new TMFRelatedEntity(enrichedRecord.Order)
            };
        }
    
        if (enrichedRecord.Order.Account != null) {
            this.relatedParty = new List<TMFRelatedParty> {
                new TMFRelatedParty(enrichedRecord.Order.Account)
            }; 
        }

        this.requiredAvailabilityDate = this.creationDate;

        this.reserveProductStockItem = new List<TMFReserveProductStockItem> {
            new TMFReserveProductStockItem(enrichedRecord)
        };

        this.reserveProductStockState = null; //for future use
        this.validFor = null; //for future use

    }

    public OrderItem enrichInput(OrderItem orderItem) {
        OrderItem enrichedRecord = [
            select 
                Id,
                vlocity_cmt__JSONAttribute__c,
                Product2Id,
                Product2.Name,
                Product2.Description,
                vlocity_cmt__RequestDate__c,
                vlocity_cmt__ServiceAccountId__r.Id,
                Order.vlocity_cmt__OriginatingChannel__c,
                Order.AccountId,
                Order.Account.Name,
                Order.Account.RecordType.DeveloperName,
                vlocity_cmt__ServiceAccountId__c
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