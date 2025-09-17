// Metadata record for SAP OData responses
public type Metadata record {
    string id?;
    string uri?;
    string 'type?;
    string etag?;
};

// Sales Order record type to structure the response
public type SalesOrder record {
    Metadata __metadata?;
    string SalesOrder?;
    string SalesOrderType?;
    string SoldToParty?;
    string CreationDate?;
    string NetAmount?;
    string TransactionCurrency?;
    string SalesOrderItem?;
    string Material?;
    string RequestedQuantity?;
};

// Collection wrapper for sales orders array
public type SalesOrderCollection record {
    SalesOrder[] results?;
};

// Response wrapper for sales orders OData response
public type SalesOrderResponse record {
    SalesOrderCollection d?;
};