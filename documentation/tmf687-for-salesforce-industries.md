# TMF687 Stock Management API

The Stock Management API provides standardized mechanism for product stock management such as creation, update and retrieval of the representation of a product stock, reserve product stock, check or query product stock or adjust product stock. It also allows the notification of events related to them.

## Application in Salesforce Industries

The Stock Management API can be used to support key capabilities provided by Salesorce Industries CPQ and Order Management:
* Validate stock availability for physical goods (for example, phones, CPEs, etc.)
* Reserve physical goods (for example, phones, CPEs, etc.) for a particular order

A stock management system can be called by a Salesforce solution as a part of a sales (quotation, enrichment, ordering) and/or fulfillment (service delivery) process.

Note: not all operations provided by this interface are relevant to a solution based on Salesforce Communication Cloud. Salesforce Communication Cloud typically provides product catalog management, configure-price-quote, contract management and order management capabilities. Thus, for example, the operations on product stock directly are not relevant for the solution. Instead, operations on task-based resources (such as check, query, reserve) are relevant to the solution based on Salesforce Communication Cloud.

# Resources

## Check Product Stock

| Field | Field Description | Additional Note | Mapping to SFI | Example |
|----|----|----|----|----|
|href|A string. Reference of the ReserveProductStock.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|id|A string. Unique identifier of the ReserveProductStock.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|@baseType|A string. When sub-classing, this defines the super-class.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|@schemaLocation|An uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|@type|A string. When sub-classing, this defines the sub-class Extensible name.|SFI_NOTE|SFI_MAPPING|EXAMPLE|

# References
* TMF OpenAPI Documentation: https://projects.tmforum.org/wiki/display/API/Open+API+Table?aliId=eyJpIjoiUEJ5TjNKN3puRG5yWllhSyIsInQiOiJtOVwvMnUyRGIxNFNkN20zaDhONkp0QT09In0%253D


