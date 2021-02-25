# TX_PVLS CQL Library files

This repository contains the sample cql library Reaource and measure Resource for Calculation of the TX_PVLS indicator for PLIR

NOTE : before you run the query below ,  **PUT** the Resources under the `files directory` to the `HAPI FHIR server` with their respective Resource id ie 

    PUT : FHIR-BASE_URL/Library/TX-PVLS 

see `files/tx_pvls.cql` for the cql Logic encoded in the TX-PVLS LIbrary

run a sample query for the measure evaluation ie

    http://localhost:8080/fhir/Measure/TX-PVLS/$evaluate-measure?periodStart=2019-01-01&periodEnd=2019-12-31
