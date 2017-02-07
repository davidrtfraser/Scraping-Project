WITH wns (title, wns, sg, mi, yt, sn) 
     AS (SELECT colnect.title                                         AS title, 
                wadp.wns                                              AS wns, 
                colnect.sg                                            AS sg, 
                colnect.mi                                            AS mi, 
                colnect.yt                                            AS yt, 
                colnect.sn                                            AS sn 
         FROM   colnect, 
                wadp 
         WHERE  colnect.wns = wadp.wns) SELECT * 
FROM   wns
UNION
SELECT wns.title 
       || " >< " 
       || catawiki.title                                 AS title, 
       wns.wns                                           AS wns, 
       COALESCE(wns.sg, catawiki.sg)                     AS sg, 
       COALESCE(wns.mi, catawiki.mi)                     AS mi, 
       COALESCE(wns.yt, catawiki.yt)                     AS yt, 
       COALESCE(wns.sn, catawiki.sn)                     AS sn 
	FROM   wns, catawiki 
	WHERE  wns.mi = catawiki.mi
UNION
SELECT wns.title  || " >< " 
       || catawiki.title AS title,
wns.wns as wns,
		COALESCE(wns.sg, catawiki.sg) 					  AS sg,
		COALESCE(wns.mi, catawiki.mi)                     AS mi, 
		COALESCE(wns.yt, catawiki.yt)                     AS yt, 
		COALESCE(wns.sn, catawiki.sn)                     AS sn 
	FROM   wns, catawiki 
	WHERE  wns.mi = catawiki.mi
UNION
SELECT wns.title AS title,
wns.wns as wns,
		COALESCE(wns.sg, poppe.Sg) 					  AS sg,
		COALESCE(wns.mi, poppe.Mi)                     AS mi, 
		COALESCE(wns.yt, poppe.Yt)                     AS yt, 
		COALESCE(wns.sn, poppe.Scott_no)                     AS sn 
	FROM   wns, poppe 
	WHERE  wns.mi = poppe.Sg
UNION
SELECT wns.title AS title,
wns.wns as wns,
		COALESCE(wns.sg, colnect.Sg) 					  AS sg,
		COALESCE(wns.mi, colnect.Mi)                     AS mi, 
		COALESCE(wns.yt, colnect.Yt)                     AS yt, 
		COALESCE(wns.sn, colnect.Sn)                     AS sn 
	FROM   wns, colnect 
	WHERE  wns.sn = colnect.Sn;
	
	