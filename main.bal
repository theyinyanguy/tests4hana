import ballerina/http;
import ballerinax/sap;

// Initialize SAP client for S4HANA system
sap:Client sapClient = check new (s4hanaUrl, {
    auth: {
        username: s4hanaUsername,
        password: s4hanaPassword
    }
});

// REST service to query sales orders
service /api on new http:Listener(8080) {
    
    // GET endpoint to retrieve all sales orders
    resource function get salesorders() returns SalesOrderResponse|error {
        
        // Call S4HANA API to get sales orders
        SalesOrderResponse salesOrderData = check sapClient->get(
            path = "/sap/opu/odata/sap/API_SALES_ORDER_SRV/A_SalesOrder",
            targetType = SalesOrderResponse
        );
        
        return salesOrderData;
    }
    
    // GET endpoint to retrieve a specific sales order by ID
    resource function get salesorders/[string salesOrderId]() returns SalesOrder|error {
        
        // Construct path for specific sales order
        string salesOrderPath = string `/sap/opu/odata/sap/API_SALES_ORDER_SRV/A_SalesOrder('${salesOrderId}')`;
        
        // Call S4HANA API to get specific sales order
        SalesOrder salesOrderData = check sapClient->get(
            path = salesOrderPath,
            targetType = SalesOrder
        );
        
        return salesOrderData;
    }
}