public with sharing class TMF687StockManagement {

    public TMF687StockManagement() {

    }

    /*******************************************************************************************************
    * @description The main method to generate payload based on TMF687 Stock Management specification
    * @param sourceRecord the record based on which the payload will be generated
    * @param method method for which payload is generated, GET or POST
    * @param operation operation name according to TMF687 Stock Management specification (productStock, reserveProductStock)
    * @param suppressApexObjectNulls suppresses null values in the generated payload, false by default
    * @return message payload for a given method and operation
    * @example
    * OrderItem sourceRecord = [select id from orderItem where id = '8020900000YBapNAAT'];
    * String method = 'POST';
    * String operation = 'reserveProductStock';
    * String payload = generatePayload(sourceRecord, method, operation, true);
    */

    public String generatePayload(SObject sourceRecord, String method, String operation, Boolean suppressApexObjectNulls) {
        String payload;

        if (method != 'GET' && method != 'POST') {
            System.debug('ERROR: ' + 'TMF687StockManagement: ' + 'Unsupported method. Only GET and POST methods are supported');
            return null;
        }

        if (operation != 'productStock' && operation != 'reserveProductStock') {
            System.debug('ERROR: ' + 'TMF687StockManagement: ' + 'Unsupported operation');
            return null;
        }

        if (method == 'POST') {
            if (operation == 'reserveProductStock') {

                if (sourceRecord.getSObjectType().getDescribe().getName() != 'OrderItem') {
                    System.debug('ERROR: ' + 'TMF687StockManagement: ' + 'Unsupported source record type. Expected OrderItem');
                    return null;
                }

                payload = JSON.serializePretty(new TMFReserveProductStock((OrderItem) sourceRecord), suppressApexObjectNulls);
                payload = payload.replace('at_', '@');
                return payload;
            }
        } else {
            //method is GET
            System.debug('ERROR: ' + 'TMF687StockManagement: ' + 'GET operation are not supported as Salesforce is not a stock management application (server)');
            return null;
        }

        return null;
    }
}