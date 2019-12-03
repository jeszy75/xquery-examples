xquery version "3.1";

(: Finding the first five most populous countries :)

let $countries := fn:doc("countries.xml")//country
return document {
    element populous-countries {
        let $sorted-countries :=
            for $country in $countries
            order by xs:integer($country/population) descending
            return $country
        return $sorted-countries[position() <= 5]
    }
}