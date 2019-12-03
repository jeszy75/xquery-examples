xquery version "3.1";

(: Finding the number of countries :)

document {
    <result>Number of countries: {fn:count(fn:doc("countries.xml")//country)}</result>
}