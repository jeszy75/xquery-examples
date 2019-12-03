xquery version "3.1";

(: Finding the number of countries by region :)

let $countries := fn:doc("countries.xml")//country
return document {
    element countries-by-region {
        for $region in fn:distinct-values($countries/region)
        order by $region
        let $count := fn:count($countries[region eq $region])
        return
            element countries {
                attribute region { $region },
                attribute count  { $count }
            }
    }
}