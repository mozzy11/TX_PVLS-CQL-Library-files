library TX_PVLS version '2.10.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

codesystem "CIEL": 'https://openconceptlab.org/orgs/CIEL/sources/CIEL'

code "Viral Load Quantitative": '856' from "CIEL" display 'HIV viral load'

code "Viral Load Qualitative": '1305' from "CIEL" display 'HIV VIRAL LOAD, QUALITATIVE'

parameter "Measurement Period" Interval<DateTime>
	default Interval[@2019-01-01T00:00:00.0, @2020-01-01T00:00:00.0)

context Patient

define "Denominator":
	"Initial Population"

define "Numerator":
	exists "Viral Load Test"

define "Viral Load Test":
	( [Observation: "Viral Load Quantitative"]
		union [Observation: "Viral Load Qualitative"] ) o
		where o.status in {'final', 'amended', 'corrected'}

define "Initial Population":
	exists "Viral Load Test"
		

