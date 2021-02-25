library TX_PVLS version '2.10.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

codesystem "CIEL": 'https://openconceptlab.org/orgs/CIEL/sources/CIEL'

code "Viral Load Quantitative": '856' from "CIEL" display 'HIV viral load'

code "Viral Load Qualitative": '1305' from "CIEL" display 'HIV VIRAL LOAD, QUALITATIVE'

code "Viral Load Qualitative Value": '1306' from "CIEL" display 'BEYOND DETECTABLE LIMIT'

parameter "Measurement Period" Interval<DateTime>

context Patient

define "Denominator":
	"Initial Population"

define "Numerator":
	exists "Viral Load Suppresed"

define "Viral Load Test":
	( [Observation: "Viral Load Quantitative"]
		union [Observation: "Viral Load Qualitative"] ) o
		where o.status in {'final', 'amended', 'corrected'}
		and o.effective in day of "Measurement Period"

define "Viral Load Suppresed":
	( [Observation: "Viral Load Quantitative"]
		union [Observation: "Viral Load Qualitative"] ) o
		where o.status in {'final', 'amended', 'corrected'}
		and o.effective in day of "Measurement Period"
		and (o.value as Quantity)  <= 1000		

define "Initial Population":
	exists "Viral Load Test"
		

