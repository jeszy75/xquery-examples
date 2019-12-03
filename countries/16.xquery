xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "html";
declare option output:html-version "5.0";
declare option output:indent "yes";

(: Creating a HTML table of European countries in decreasing order of population :)

<html>
    <head>
        <title>European Countries</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous"/>
    </head>
    <body>
        <div class="container">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>#</th>
                        <th>Country</th>
                        <th>Population</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        let $countries := fn:doc("countries.xml")//country
                        for $country in $countries
                        where $country/region eq "Europe"
                        order by xs:integer($country/population) descending
                        count $rank
                        return
                            <tr>
                                <td>{ $rank }</td>
                                <td>{ fn:data($country/name) }</td>
                                <td>{ fn:data($country/population) }</td>
                            </tr>
                    }
                </tbody>
            </table>
        </div>
    </body>
</html>