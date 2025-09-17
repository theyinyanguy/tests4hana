// Sales Order record type to structure the response
public type SalesOrder record {
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

// Response wrapper for sales orders collection
public type SalesOrderResponse record {
    SalesOrder[] d?;
};