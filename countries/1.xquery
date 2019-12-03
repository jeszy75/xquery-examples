xquery version "3.1";

(: Finding the number of countries :)

fn:count(fn:doc("countries.xml")//country)