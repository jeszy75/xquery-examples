xquery version "3.1";

import schema default element namespace "" at "countries.xsd";

(: Finding the first five most populous countries :)

let $countries := fn:doc("countries.xml")//country
return document {
    element populous-countries {
        for $country in $countries
        order by $country/population descending
        count $rank
        where $rank <= 5
        return $country
    }
}