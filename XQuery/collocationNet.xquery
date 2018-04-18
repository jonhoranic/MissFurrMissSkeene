let $gay := //repTerm[./lower-case(normalize-space()) = "gay"]
let $countGay := count($gay)
for $g in $gay
let $precFive := $g/preceding-sibling::*[not(./name() = 'punct')][position() lt 5]/lower-case(normalize-space())
let $followFive := $g/following-sibling::*[not(./name() = 'punct')][position() lt 5]/lower-case(normalize-space())
let $colloc := ($precFive, $followFive)
let $distinctColloc := distinct-values($colloc)
for $c in $distinctColloc
let $steinMatch := $gay[preceding-sibling::*[not(./name() = 'punct')][position() lt 5]/lower-case(normalize-space()) = $c or following-sibling::*[not(./name() = 'punct')][position() lt 5]/lower-case(normalize-space()) = $c]
let $countSteinMatch := count($steinMatch)
order by $countSteinMatch descending
return ($g/string(), "&#9;", "colloc_5_EitherDirection", "&#9;", $c, "&#9;", $countSteinMatch, "&#10;") 