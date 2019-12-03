xquery version "3.1";

(: Extract all data from the SWAPI available at https://swapi.co/ :)

declare namespace array = "http://www.w3.org/2005/xpath-functions/array";
declare namespace map = "http://www.w3.org/2005/xpath-functions/map";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "json";
declare option output:indent "yes";

declare function local:get-all($uri as xs:string) as array(*)
{
    trace((), "Retrieving data from " || $uri),
    let $page := json-doc($uri)
    return if (empty($page?next)) then $page?results else array:join(($page?results, local:get-all($page?next)))
};

map{
    "films": local:get-all("https://swapi.co/api/films/"),
    "people": local:get-all("https://swapi.co/api/people/"),
    "planets": local:get-all("https://swapi.co/api/planets/"),
    "species": local:get-all("https://swapi.co/api/species/"),
    "starships": local:get-all("https://swapi.co/api/starships/"),    
    "vehicles": local:get-all("https://swapi.co/api/vehicles/")
}
