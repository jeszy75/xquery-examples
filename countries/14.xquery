xquery version "3.1";

import schema default element namespace "" at "countries-by-region.xsd";

(: Finding the number of countries by region and validating the result document :)

let $countries := fn:doc("countries.xml")//country
return validate {
    document {
        element countries-by-region {
            for $country in $countries
            group by $region := $country/region
            order by $region
            return
                element countries {
                    attribute region { $region },
                    attribute count { fn:count($country) }
                }
        }
    }
}