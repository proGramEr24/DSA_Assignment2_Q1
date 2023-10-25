import ballerina/graphql;
import ballerina/io;

type KPIResponse record {|
    record {|anydata kpi;|} data;
|};

public function main() returns error? {
    
    graphql:Client graphqlClient = check new ("localhost:2120/keyPerformanceIndicators");

     string doc = string `
    mutation addDeptObjective($FirstName:String!,$LastName:String!,$JobTitle:String!,$Position:String!,$Role:String!,$PerformanceRecords:String!,$KPI_Objectives:String!){
        addDeptObjective(newDeptObjective:{FirstName:$FirstName,LastName:$LastName,JobTitle:$JobTitle,Position:$Position,Role:$Role,PerformanceRecords:$PerformanceRecords,KPI_Objectives:$KPI_Objectives})
    }`;

    KPIResponse addKPIResponse = check graphqlClient->execute(doc, {"FirstName": "Lisa", "LastName": "Mabena", "JobTitle": "DSALecturer", "Position": "HOD", "Role": "Supervise"});

    io:println("Response ", addKPIResponse);
}