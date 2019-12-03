xquery version "3.1";

declare namespace map = "http://www.w3.org/2005/xpath-functions/map";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "json";

(: Finding the number of countries by region :)

let $countries := fn:doc("countries.xml")//country
return
    (
        for $country in $countries
        group by $region := $country/region
        return map:entry($region, fn:count($country))
    ) => map:merge()