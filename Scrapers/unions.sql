SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN WADP ON colnect.WNS=WADP.WNS 
UNION
SELECT NULL, WADP.Country, NULL, NULL, NULL, NULL, NULL,WADP.WNS FROM WADP LEFT OUTER JOIN colnect ON colnect.WNS=WADP.WNS

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN catawiki ON colnect.Mi=catawiki.Mi
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN  colnect ON colnect.Mi=catawiki.Mi

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN catawiki ON colnect.Yt=catawiki.Yt
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN  colnect ON colnect.Yt=catawiki.Yt

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN catawiki ON colnect.Sg=catawiki.Sg
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN  colnect ON colnect.Sg=catawiki.Sg

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN catawiki ON colnect.Sn=catawiki.Sn
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN  colnect ON colnect.Sn=catawiki.Sn

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN poppe ON colnect.Sg=poppe.Sg
UNION
SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN colnect ON colnect.Sg=poppe.Sg

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN poppe ON colnect.Sn=poppe.Scott_no
UNION
SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN colnect ON colnect.Sn=poppe.Scott_no

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN poppe ON colnect.Yt=poppe.Yt
UNION
SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN colnect ON colnect.Yt=poppe.Yt

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN poppe ON colnect.Mi=poppe.Mi
UNION
SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN colnect ON colnect.Mi=poppe.Mi

UNION

SELECT colnect.Title, colnect.Country, colnect.Series, colnect.Mi, colnect.Yt, colnect.Sn, colnect.Sg, colnect.WNS FROM colnect LEFT OUTER JOIN Vista ON colnect.Sn=Vista.Sn
UNION
SELECT NULL, Vista.Country, NULL, NULL, NULL, Vista.Sn, NULL, NULL FROM Vista LEFT OUTER JOIN colnect ON colnect.Sn=Vista.Sn

UNION

SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN Vista ON catawiki.Sn=Vista.Sn
UNION
SELECT NULL, Vista.Country, NULL, NULL, NULL, Vista.Sn, NULL, NULL FROM Vista LEFT OUTER JOIN catawiki ON catawiki.Sn=Vista.Sn

UNION

SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN Vista ON poppe.Scott_no=Vista.Sn
UNION
SELECT NULL, Vista.Country, NULL, NULL, NULL, Vista.Sn, NULL, NULL FROM Vista LEFT OUTER JOIN poppe ON poppe.Scott_no=Vista.Sn

UNION

SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN catawiki on poppe.Scott_no=catawiki.Sn
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN poppe ON poppe.Scott_no=catawiki.Sn

UNION

SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN catawiki on poppe.Sg=catawiki.Sg
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN poppe ON poppe.Sg=catawiki.Sg

UNION

SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN catawiki on poppe.Mi=catawiki.Mi
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN poppe ON poppe.Mi=catawiki.Mi

UNION

SELECT NULL, poppe.Country, NULL, poppe.Mi, poppe.Yt, poppe.Scott_no, poppe.Sg, NULL FROM poppe LEFT OUTER JOIN catawiki on poppe.Yt=catawiki.Yt
UNION
SELECT catawiki.Title, catawiki.Country_area, NULL, catawiki.Mi, catawiki.Yt, catawiki.Sn, catawiki.Sg, NULL FROM catawiki LEFT OUTER JOIN poppe ON poppe.Yt=catawiki.Yt
