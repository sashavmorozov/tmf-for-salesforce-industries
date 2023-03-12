# Background and Rationale

## TMF687 Stock Management API

The Stock Management API provides standardized mechanism for product stock management such as creation, update and retrieval of the representation of a product stock, reserve product stock, check or query product stock or adjust product stock. It also allows the notification of events related to them.

## Application in Salesforce Industries

The Stock Management API can be used to support key capabilities provided by Salesorce Industries CPQ and Order Management:
* Validate stock availability for physical goods (for example, phones, CPEs, etc.)
* Reserve physical goods (for example, phones, CPEs, etc.) for a particular order

A stock management system can be called by a Salesforce solution as a part of a sales (quotation, enrichment, ordering) and/or fulfillment (service delivery) process.

Note: not all operations provided by this interface are relevant to a solution based on Salesforce Communication Cloud. Salesforce Communication Cloud typically provides product catalog management, configure-price-quote (CPQ), contract management (CLM) and order management (OM) capabilities. Thus, for example, the operations on product stock directly are not relevant for the solution. Instead, operations on task-based resources (such as check, query, reserve) are relevant to the solution based on Salesforce Communication Cloud.

# Solution

This is a very simple solution to only help you to generate TMF-compatible payload based on Salesforce Communication Cloud data. The solution does not include anything else - you can set up the integration mechanics using the tools you prefer (usually you already have something in place). This solution gives you only payload, the rest is up to you.

Once you generate the payload with this solution:
- You can furhter tailor the payload (extend, override, etc.) to fit your requirements (perhaps, you want to add some extra information)
- Authenticate your client to send the payload (if applicable)
- Send the payload to the server that will process your request
- Receive and process the response from the server

For this, you can use the tools (Salesforce Apex, Omniscripts, Flows, etc.) and applications (middleware) you prefer

The solution is not formally certified against TM Forum certification kits (may be considered in future).

## Configuration Settings
The solution includes default mapping between Salesforce Communications Cloud data model and TM Forum Open API resource model. No configuration settings are provided.

If you need to furhter tailor the payload (extend, override, etc.) to fit your requirements - you can use any preferred JSON manipulation tool or technique. [Salesforce DataRaptors (Transform)](https://help.salesforce.com/s/articleView?id=sf.os_dataraptor_transform_overview.htm&type=5) can be a very good no-code way to extend the default payload.

## API

The solution provides the following APIs:
* Apex API, so you can generate the payload from your Apex class (e.g. a CPQ hook, order management autotask, a trigger, a flow, etc.)

```java
    OrderItem sourceRecord = [select id from orderItem where id = '8020900000YBapNAAT'];
    TMF687StockManagement generator = new TMF687StockManagement();
    String method = 'POST';
    String operation = 'reserveProductStock';
    String payload = generator.generatePayload(sourceRecord, method, operation, true);
    System.debug(payload);
```

* Salesforce Industries Open Interface (in progress, not available yet), so you can generate the payload from [Salesforce OmniScripts](https://help.salesforce.com/s/articleView?id=sf.os_omniscripts_8355.htm&language=en_US&type=5) and [Integration Procedures](https://help.salesforce.com/s/articleView?id=sf.os_integration_procedures.htm&language=en_US&type=5)

## User Experience

The solution provides only the API to generate a payload in TMF-compliant format. No user interface provided

# Adoption

The solution includes default mapping between Salesforce Communications Cloud data model and TM Forum Open API resource model and the API to generate a payload. No configuration required. Once you install the solution (see further sections), you can use the provided APIs to generate the payload in the context of your integration processes.

If you need to furhter tailor the payload (extend, override, etc.) to fit your requirements - you can use any preferred JSON manipulation tool or technique. For example, you may want to:
* Include additional data into the payload (e.g. for the fields that are not supported by this solution by default, of fields that are mapped on your custom data model extensions in Salesforce)
* Override values generated based on the default mapping
* Remove payload elements that you don't want to include in the payload

[Salesforce DataRaptors (Transform)](https://help.salesforce.com/s/articleView?id=sf.os_dataraptor_transform_overview.htm&type=5) can be a very good no-code way to extend the default payload.

## Key Artifacts

* Apex classes representing the TM Forum Open API resource model
* Apex classes generating the payload

## Installation

> The solution is planned to be available as an application on Salesforce AppExchange in the coming future

1. Clone the repository to your local machine
2. Configure [Salesforce IDX Workbench](https://trailhead.salesforce.com/content/learn/modules/omnistudio-developer-tools/meet-idx-build-tool-) to use the cloned repository as a source, and the target Salesforce org as the target
3. Choose the artifacts to deploy in Salesforce IDX Workbench
4. Deploy (migrate/migrate with dependencies) the specified artefacts to your target org
5. Verify the new operations (provided by the application/tool) work as expected

# Known Issues and Limitations

* The solution can generate the payload for a single input Salesforce records only. The solution will be bulkified in the coming future


# Support, Feedback and Collaboration

* Safe harbour, this application/tool/utility is not an official Salesforce product
* Share the found issues, feedback and suggestions with our team using GitHub (at this moment)

# Other Notes

# Reference Materials
* TMF OpenAPI Documentation: https://projects.tmforum.org/wiki/display/API/Open+API+Table?aliId=eyJpIjoiUEJ5TjNKN3puRG5yWllhSyIsInQiOiJtOVwvMnUyRGIxNFNkN20zaDhONkp0QT09In0%253D

## TMF687. Reserve Product Stock (reserveProductStock)

| Field | Field Description | Additional Note | Mapping to SFI | Example |
|----|----|----|----|----|
|href|A string. Reference of the ReserveProductStock.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|id|A string. Unique identifier of the ReserveProductStock.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|@baseType|A string. When sub-classing, this defines the super-class.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|@schemaLocation|An uri (Uri). A URI to a JSON-Schema file that defines additional attributes and relationships.|SFI_NOTE|SFI_MAPPING|EXAMPLE|
|@type|A string. When sub-classing, this defines the sub-class Extensible name.|SFI_NOTE|SFI_MAPPING|EXAMPLE|





