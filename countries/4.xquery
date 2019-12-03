xquery version "3.1";

(: Finding the number of countries by region :)

let $countries := fn:doc("countries.xml")//country
return document {
    <countries-by-region>
        {
            for $region in fn:distinct-values($countries/region)
            order by $region
            let $count := fn:count($countries[region eq $region])
            return
                <countries region="{$region}" count="{$count}"/>
        }
    </countries-by-region>
}