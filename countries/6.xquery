xquery version "3.1";

(: Finding the number of countries by region :)

let $countries := fn:doc("countries.xml")//country
return document {
    element countries-by-region {
        for $country in $countries
        group by $region := $country/region
        let $count := fn:count($country)
        order by $region
        return
            element countries {
                attribute region { $region },
                attribute count { $count }
            }
    }
}