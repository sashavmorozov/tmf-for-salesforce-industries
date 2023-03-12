# TMForum OpenAPIs for Salesforce Communications Cloud

TM Forum Open APIs are a set of standardized application programming interfaces (APIs) that are designed to promote interoperability, reduce integration costs, and accelerate innovation within the telecommunications and digital service provider industry. These APIs are based on open standards and are publicly available, allowing developers and businesses to access them and build solutions that are compatible with a wide range of systems and platforms. There are around 60 integration interfaces (APIs) defined by TMForum. To learn more about TMForum OpenAPIs, refer to https://www.tmforum.org/oda/about-open-apis/

## Application in Salesforce Communications Cloud

[Salesforce Communications Cloud](https://www.salesforce.com/solutions/industries/communications/communications-cloud/) is a suite of cloud-based tools designed for communications service providers to manage customer interactions and experiences. Typically, Salesforce Communication Cloud provides product catalog management, configure-price-quote (CPQ), contract management (CLM), and order management (OM) capabilities. These capabilities can be integrated with other components of your solution with TMForum OpenAPIs.

When creating a solution based on Salesforce Communications Cloud, the following APIs are used the most often:
* Account Management API - TMF666
* Appointment Management API - TMF646
* Entity Catalog Management API - TMF662
* Product Ordering Management API - TMF622
* Service Ordering Management API - TMF641
* Stock Management API - TMF687

Note: not all APIs (and not all operations provided by each interface) are relevant to a solution based on Salesforce Communication Cloud.
> Note: review the list

# Solution

This is a very simple solution to only help you to generate a TMF-compatible payload based on Salesforce Communication Cloud data. At this moment the focus is on the integration scenarios where Salesforce Communications Cloud acts as an API client. The solution does not include anything else - you can set up the integration mechanics using the tools and infrastructure you prefer (usually you already have something in place). This solution gives you only payload, the rest is up to you. This includes managing the integration process, waiting and processing responses, integration middleware, authentication, API versioning, etc.

Once you generate the payload with this solution:
- You can further tailor the payload (extend, override, etc.) to fit your requirements (perhaps, you want to add some extra information)
- Authenticate your client to send the payload (if applicable)
- Send the payload to the server that will process your request
- Receive and process the response from the server

For this, you can use the tools (Salesforce Apex, Omniscripts, Flows, etc.) and applications (middleware) you prefer

The solution is not formally certified against TM Forum certification kits (may be considered in the future).

## Supported APIs

> The list of supported APIs, operations, and data sources will grow over time. Have a specific request - let us know

* [Stock Management API - TMF687](https://github.com/sashavmorozov/tmf-for-salesforce-industries/blob/main/documentation/tmf687-for-salesforce-industries.md) 

## Configuration Settings
The solution includes default mapping between the Salesforce Communications Cloud data model and TM Forum Open API resource model. No configuration settings are provided.

If you need to further tailor the payload (extend, override, etc.) to fit your requirements - you can use any preferred JSON manipulation tool or technique. [Salesforce DataRaptors (Transform)](https://help.salesforce.com/s/articleView?id=sf.os_dataraptor_transform_overview.htm&type=5) can be a very good no-code way to extend the default payload.

## API

The solution provides the following APIs:
* Apex API, so you can generate the payload from your Apex class (e.g. a CPQ hook, order management auto task, a trigger, a flow, etc.)

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

The solution provides only the API to generate a payload in the TMF-compliant format. No user interface provided

# Adoption

The solution includes default mapping between the Salesforce Communications Cloud data model and TM Forum Open API resource model and the API to generate a payload. No configuration is required. Once you install the solution (see further sections), you can use the provided APIs to generate the payload in the context of your integration processes.

If you need to further tailor the payload (extend, override, etc.) to fit your requirements - you can use any preferred JSON manipulation tool or technique. For example, you may want to:
* Include additional data into the payload (e.g. for the fields that are not supported by this solution by default, or fields that are mapped on your custom data model extensions in Salesforce)
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
4. Deploy (migrate/migrate with dependencies) the specified artifacts to your target org
5. Verify the new operations (provided by the application/tool) work as expected

# Known Issues and Limitations

* The solution can generate the payload for a single input Salesforce records only. The solution will be bulkified in the coming future


# Support, Feedback, and Collaboration

* Safe harbor, this application/tool/utility is not an official Salesforce product
* Share the found issues, feedback, and suggestions with our team using GitHub (at this moment)

# Other Notes

# Reference Materials
* [TMF OpenAPI Documentation](https://projects.tmforum.org/wiki/display/API/Open+API+Table?aliId=eyJpIjoiUEJ5TjNKN3puRG5yWllhSyIsInQiOiJtOVwvMnUyRGIxNFNkN20zaDhONkp0QT09In0%253D)