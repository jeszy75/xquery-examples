xquery version "3.1";

(: Copying the input document with modifications (requires XQuery Update to be enabled) :)

let $countries := fn:doc("countries.xml")
return
    copy $copy := $countries
    modify (
        rename node $copy/countries as "countries-of-the-world",
        delete node $copy//country/@alpha2Code,
        for $alpha3Code in $copy//*/@alpha3Code return rename node $alpha3Code as "code",
        delete node $copy//country/translations
    )
    return $copy