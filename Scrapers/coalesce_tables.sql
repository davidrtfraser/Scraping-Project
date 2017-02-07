CREATE TEMPORARY TABLE colnect_WADP 
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colnect_WADP
SELECT colnect.Title as Title, coalesce(WADP.Country,colnect.Country) as Country, coalesce(WADP."Subject/Series",colnect.Series) as Series, 
colnect.Mi as Mi, colnect.Yt as Yt, colnect.Sn as Sn, colnect.Sg as Sg, coalesce(colnect.WNS,WADP.WNS) as WNS 
FROM colnect LEFT OUTER JOIN WADP ON colnect.WNS=WADP.WNS 
UNION
SELECT colnect.Title as Title, coalesce(WADP.Country, colnect.Country) as Country, coalesce(WADP."Subject/Series",colnect.Series) as Series, 
colnect.Mi as Mi, colnect.Yt as Yt, colnect.Sn as Sn, colnect.Sg as Sg, coalesce(colnect.WNS,WADP.WNS) as WNS 
FROM WADP LEFT OUTER JOIN colnect ON colnect.WNS=WADP.WNS;

CREATE TEMPORARY TABLE colnectWADP_catawiki_mi 
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colnectWADP_catawiki_mi
SELECT coalesce(colnect_WADP.Title,catawiki.Title) as Title, coalesce(colnect_WADP.Country,catawiki.Country_area) as Country, 
colnect_WADP.Series as series, coalesce(colnect_WADP.Mi, catawiki.Mi) as Mi, coalesce(colnect_WADP.Yt,catawiki.Yt) as Yt, 
coalesce(colnect_WADP.Sn,catawiki.Sn) as Sn, coalesce(colnect_WADP.Sg,catawiki.Sg) as Sg, colnect_WADP.wns as WNS FROM colnect_WADP 
LEFT OUTER JOIN catawiki ON colnect_WADP.Mi=catawiki.Mi
UNION
SELECT coalesce(colnect_WADP.Title,catawiki.Title), coalesce(colnect_WADP.Country, catawiki.Country_area) as Country, 
colnect_WADP.Series as series, coalesce(colnect_WADP.Mi,catawiki.Mi) as Mi, coalesce(colnect_WADP.Yt,catawiki.Yt) as Yt, 
coalesce(colnect_WADP.Sn,catawiki.Sn) as Sn, coalesce(colnect_WADP.Sg, catawiki.Sg) as Sg, colnect_WADP.wns as wns 
FROM catawiki LEFT OUTER JOIN colnect_WADP ON colnect_WADP.Mi=catawiki.Mi;

CREATE TEMPORARY TABLE colnectWADP_catawiki_sg
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colnectWADP_catawiki_sg
SELECT coalesce(colnect_WADP.Title,catawiki.Title) as Title, coalesce(colnect_WADP.Country,catawiki.Country_area) as Country, 
colnect_WADP.Series as series, coalesce(colnect_WADP.Mi, catawiki.Mi) as Mi, coalesce(colnect_WADP.Yt,catawiki.Yt) as Yt, 
coalesce(colnect_WADP.Sn,catawiki.Sn) as Sn, coalesce(colnect_WADP.Sg,catawiki.Sg) as Sg, colnect_WADP.wns as WNS FROM colnect_WADP 
LEFT OUTER JOIN catawiki ON colnect_WADP.Sg=catawiki.Sg
UNION
SELECT coalesce(colnect_WADP.Title,catawiki.Title), coalesce(colnect_WADP.Country, catawiki.Country_area) as Country, 
colnect_WADP.Series as series, coalesce(colnect_WADP.Mi,catawiki.Mi) as Mi, coalesce(colnect_WADP.Yt,catawiki.Yt) as Yt, 
coalesce(colnect_WADP.Sn,catawiki.Sn) as Sn, coalesce(colnect_WADP.Sg, catawiki.Sg) as Sg, colnect_WADP.wns as wns 
FROM catawiki LEFT OUTER JOIN colnect_WADP ON colnect_WADP.Sg=catawiki.Sg;

CREATE TEMPORARY TABLE colnectWADP_catawiki
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colnectWADP_catawiki
SELECT coalesce(colnectWADP_catawiki_mi.Title,colnectWADP_catawiki_sg.Title) as Title, coalesce(colnectWADP_catawiki_mi.Country, colnectWADP_catawiki_sg.Country) as Country, 
coalesce(colnectWADP_catawiki_mi.Series,colnectWADP_catawiki_sg.Series) as series, coalesce(colnectWADP_catawiki_mi.Mi, colnectWADP_catawiki_sg.Mi) as Mi, coalesce(colnectWADP_catawiki_mi.Yt,colnectWADP_catawiki_sg.Yt) as Yt, 
coalesce(colnectWADP_catawiki_mi.Sn,colnectWADP_catawiki_sg.Sn) as Sn, coalesce(colnectWADP_catawiki_mi.Sg,colnectWADP_catawiki_sg.Sg) as Sg, coalesce(colnectWADP_catawiki_mi.wns,colnectWADP_catawiki_sg.wns) as WNS 
FROM colnectWADP_catawiki_mi
LEFT OUTER JOIN colnectWADP_catawiki_sg ON colnectWADP_catawiki_mi.mi=colnectWADP_catawiki_sg.mi
UNION
SELECT coalesce(colnectWADP_catawiki_mi.Title,colnectWADP_catawiki_sg.Title) as Title, coalesce(colnectWADP_catawiki_mi.Country,colnectWADP_catawiki_sg.Country) as Country, 
coalesce(colnectWADP_catawiki_mi.Series,colnectWADP_catawiki_sg.Series) as series, coalesce(colnectWADP_catawiki_mi.Mi, colnectWADP_catawiki_sg.Mi) as Mi, coalesce(colnectWADP_catawiki_mi.Yt,colnectWADP_catawiki_sg.Yt) as Yt, 
coalesce(colnectWADP_catawiki_mi.Sn,colnectWADP_catawiki_sg.Sn) as Sn, coalesce(colnectWADP_catawiki_mi.Sg,colnectWADP_catawiki_sg.Sg) as Sg, coalesce(colnectWADP_catawiki_mi.wns,colnectWADP_catawiki_sg.wns) as WNS 
FROM colnectWADP_catawiki_sg 
LEFT OUTER JOIN colnectWADP_catawiki_mi ON colnectWADP_catawiki_mi.mi=colnectWADP_catawiki_sg.mi;


CREATE TEMPORARY TABLE colnectWADPcata_poppe
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colnectWADPcata_poppe
SELECT colnectWADP_catawiki.Title as Title, colnectWADP_catawiki.Country as Country, 
colnectWADP_catawiki.Series as Series, coalesce(colnectWADP_catawiki.Mi,poppe.Mi) as Mi, coalesce(colnectWADP_catawiki.Yt,poppe.Yt) as Yt, 
coalesce(colnectWADP_catawiki.Sn,poppe.Scott_no) as Sn, coalesce(colnectWADP_catawiki.Sg,poppe.Sg) as Sg, colnectWADP_catawiki.WNS as WNS FROM colnectWADP_catawiki 
LEFT OUTER JOIN poppe ON colnectWADP_catawiki.Sg=poppe.Sg
UNION
SELECT NULL as Title, poppe.Country as Country, 
NULL as Series, coalesce(colnectWADP_catawiki.Mi,poppe.Mi) as Mi, coalesce(colnectWADP_catawiki.Yt, poppe.Yt)as Yt, 
coalesce(colnectWADP_catawiki.Sn,poppe.Scott_no) as Sn, coalesce(colnectWADP_catawiki.Sg,poppe.Sg) as Sg, NULL as WNS FROM poppe 
LEFT OUTER JOIN colnectWADP_catawiki ON colnectWADP_catawiki.Sg=poppe.Sg;

CREATE TEMPORARY TABLE colWADPcataPOP_Vista_1
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colWADPcataPOP_Vista_1
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn,Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM colnectWADPcata_poppe 
LEFT OUTER JOIN Vista ON colnectWADPcata_poppe.Sn=Vista.Sn
UNION
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn, Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM Vista 
LEFT OUTER JOIN colnectWADPcata_poppe ON colnectWADPcata_poppe.Sn=Vista.Sn;
DELETE FROM colWADPcataPOP_Vista_1 WHERE rowid NOT IN (SELECT MAX(rowid) FROM colWADPcataPOP_Vista_1 GROUP BY Mi);

CREATE TEMPORARY TABLE colWADPcataPOP_Vista_2
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colWADPcataPOP_Vista_2
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn,Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM colnectWADPcata_poppe 
LEFT OUTER JOIN Vista ON colnectWADPcata_poppe.Sn=Vista.Sn
UNION
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn, Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM Vista 
LEFT OUTER JOIN colnectWADPcata_poppe ON colnectWADPcata_poppe.Sn=Vista.Sn;
DELETE FROM colWADPcataPOP_Vista_2 WHERE rowid NOT IN (SELECT MAX(rowid) FROM colWADPcataPOP_Vista_2 GROUP BY Sg);

CREATE TEMPORARY TABLE colWADPcataPOP_Vista_3
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colWADPcataPOP_Vista_3
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn,Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM colnectWADPcata_poppe 
LEFT OUTER JOIN Vista ON colnectWADPcata_poppe.Sn=Vista.Sn
UNION
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn, Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM Vista 
LEFT OUTER JOIN colnectWADPcata_poppe ON colnectWADPcata_poppe.Sn=Vista.Sn;
DELETE FROM colWADPcataPOP_Vista_3 WHERE rowid NOT IN (SELECT MAX(rowid) FROM colWADPcataPOP_Vista_3 GROUP BY Yt);

CREATE TEMPORARY TABLE colWADPcataPOP_Vista_4
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colWADPcataPOP_Vista_4
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn,Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM colnectWADPcata_poppe 
LEFT OUTER JOIN Vista ON colnectWADPcata_poppe.Sn=Vista.Sn
UNION
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn, Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM Vista 
LEFT OUTER JOIN colnectWADPcata_poppe ON colnectWADPcata_poppe.Sn=Vista.Sn;
DELETE FROM colWADPcataPOP_Vista_4 WHERE rowid NOT IN (SELECT MAX(rowid) FROM colWADPcataPOP_Vista_4 GROUP BY Sn);

CREATE TEMPORARY TABLE colWADPcataPOP_Vista_5
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO colWADPcataPOP_Vista_5
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn,Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM colnectWADPcata_poppe 
LEFT OUTER JOIN Vista ON colnectWADPcata_poppe.Sn=Vista.Sn
UNION
SELECT coalesce(colnectWADPcata_poppe.Title,Vista.Name) as Title, coalesce(colnectWADPcata_poppe.Country,Vista.Country) as Country, 
coalesce(colnectWADPcata_poppe.Series,Vista.Issue) as Series, colnectWADPcata_poppe.Mi as Mi, colnectWADPcata_poppe.Yt as Yt, 
coalesce(colnectWADPcata_poppe.Sn, Vista.Sn) as Sn, colnectWADPcata_poppe.Sg as Sg, colnectWADPcata_poppe.WNS as WNS FROM Vista 
LEFT OUTER JOIN colnectWADPcata_poppe ON colnectWADPcata_poppe.Sn=Vista.Sn;
DELETE FROM colWADPcataPOP_Vista_5 WHERE rowid NOT IN (SELECT MAX(rowid) FROM colWADPcataPOP_Vista_5 GROUP BY wns);

CREATE TABLE reference 
(Title TEXT DEFAULT NULL,
Country TEXT DEFAULT NULL,
Series TEXT DEFAULT NULL,
Mi TEXT DEFAULT NULL,
Yt TEXT DEFAULT NULL,
Sn TEXT DEFAULT NULL,
Sg TEXT DEFAULT NULL,
WNS TEXT DEFAULT NULL);
INSERT INTO reference 
SELECT * FROM colWADPcataPOP_Vista_1
UNION
SELECT * FROM colWADPcataPOP_Vista_2
UNION 
SELECT * FROM colWADPcataPOP_Vista_3
UNION 
SELECT * FROM colWADPcataPOP_Vista_4
UNION 
SELECT * FROM colWADPcataPOP_Vista_5;
DROP TABLE colnect_WADP;
DROP TABLE colnectWADP_catawiki;
DROP TABLE colnectWADP_catawiki_mi;
DROP TABLE colnectWADP_catawiki_sg;
DROP TABLE colnectWADPcata_poppe;
DROP TABLE colWADPcataPOP_Vista_1;
DROP TABLE colWADPcataPOP_Vista_2;
DROP TABLE colWADPcataPOP_Vista_3;
DROP TABLE colWADPcataPOP_Vista_4;
DROP TABLE colWADPcataPOP_Vista_5;
