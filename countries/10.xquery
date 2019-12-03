xquery version "3.1";

import schema default element namespace "" at "countries.xsd";

(: Finding the most populous country by region :)

let $countries := fn:doc("countries.xml")//country
return document {
    element populous-countries {
        for $country in $countries
        group by $region := $country/region
        order by $region
        let $max-population := fn:max($country/population)
        return
            element countries {
                attribute region { $region },
                $country[population eq $max-population]
            }
    }
}