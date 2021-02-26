# TX_PVLS CQL Library files (WIP)

This repository contains the sample cql library Reaource and measure Resource for Calculation of the TX_PVLS indicator for PLIR

NOTE : before you run the query below ,  **PUT** the Resources under the `files directory` to the `HAPI FHIR server` with their respective Resource id ie 

    PUT : FHIR-BASE_URL/Library/TX-PVLS 

see `files/tx_pvls.cql` for the cql Logic encoded in the TX-PVLS LIbrary

To evalutae the TX_PVLS Measure resource for TX_PVLS indicator calculation ,


    GET: http://localhost:8080/fhir/Measure/TX-PVLS/$evaluate-measure?periodStart=2021-01-01&periodEnd=2021-12-31


To evalutae the TX_PVLS Measure resource for generating the dataset for the Indicator , 

    GET: http://localhost:8080/fhir/Measure/TX-PVLS/$collect-data?periodStart=2021-01-01&periodEnd=2021-12-31