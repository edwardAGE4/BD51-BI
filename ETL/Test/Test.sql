-------------------------------------------------
-- INSERT
-------------------------------------------------

-- CALENDAR_YEAR_LOOKUP

INSERT INTO CALENDAR_YEAR_LOOKUP (WEEK_KEY,WEEK_IN_YEAR,YEAR,FISCAL_PERIOD,YEAR_WEEK,QUARTER,MONTH_NAME,MONTH,HOLIDAY_FLAG)
VALUES (263,1,2014,'FY14','2014/1',1,'January',1,'y');

INSERT INTO CALENDAR_YEAR_LOOKUP (WEEK_KEY,WEEK_IN_YEAR,YEAR,FISCAL_PERIOD,YEAR_WEEK,QUARTER,MONTH_NAME,MONTH,HOLIDAY_FLAG)
VALUES (264,2,2014,'FY14','2014/2',1,'January',1,'n');

INSERT INTO CALENDAR_YEAR_LOOKUP (WEEK_KEY,WEEK_IN_YEAR,YEAR,FISCAL_PERIOD,YEAR_WEEK,QUARTER,MONTH_NAME,MONTH,HOLIDAY_FLAG)
VALUES (1,1,2014,'FY14','2014/1',2,'January',1,'n');

INSERT INTO CALENDAR_YEAR_LOOKUP (WEEK_KEY,WEEK_IN_YEAR,YEAR,FISCAL_PERIOD,YEAR_WEEK,QUARTER,MONTH_NAME,MONTH,HOLIDAY_FLAG)
VALUES (1,1,1997,'FY17','1997/1',1,'January',1,'n'); 

COMMIT;

-- OULTET_LOOKUP

INSERT INTO OUTLET_LOOKUP (SHOP_NAME,ADDRESS_1,MANAGER,DATE_OPEN,OPEN,OWNED_OUTRIGHT,FLOOR_SPACE,ZIP_CODE,CITY,STATE,SHOP_CODE)
VALUES ('e-Fashion Paris','450 Champs Elysées','John',TO_DATE('02/01/14', 'dd/mm/yy'),'Y','Y',3000,75000,'Paris','Ile de France',353);
	
INSERT INTO OUTLET_LOOKUP (SHOP_NAME,ADDRESS_1,MANAGER,DATE_OPEN,OPEN,OWNED_OUTRIGHT,FLOOR_SPACE,ZIP_CODE,CITY,STATE,SHOP_CODE)
VALUES ('e-Fashion Londres','90 Oxford Street','Harry',TO_DATE('02/01/14', 'dd/mm/yy'),'Y','Y',1500,000000,'Londres','Londres',354);

INSERT INTO OUTLET_LOOKUP (SHOP_NAME,ADDRESS_1,MANAGER,DATE_OPEN,OPEN,OWNED_OUTRIGHT,FLOOR_SPACE,ZIP_CODE,CITY,STATE,SHOP_CODE)
VALUES ('e-Fashion Belfort','6 rue madrid','william',TO_DATE('05/01/14', 'dd/mm/yy'),'Y','Y',3000,90000,'Belfort','Belfort',354);

INSERT INTO OUTLET_LOOKUP (SHOP_NAME,ADDRESS_1,MANAGER,DATE_OPEN,OPEN,OWNED_OUTRIGHT,FLOOR_SPACE,ZIP_CODE,CITY,STATE,SHOP_CODE) 
VALUES ('e-Fashion Washington Tolbooth','32, Tolbooth Street','Barrett',TO_DATE('20/12/98', 'dd/mm/yy'),'Y','Y',4160,548915,'Washington','DC',3);

COMMIT;
	
-- ARTICLE_LOOKUP

INSERT INTO ARTICLE_LOOKUP (ARTICLE_CODE,ARTICLE_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (189480,'Longline T-Shirts','T-Shirts',26.99,'Sweat-T-Shirts','F36');
	
INSERT INTO ARTICLE_LOOKUP (ARTICLE_CODE,ARTICLE_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (189481,'Long Short','Bermudas',24.99,'City Trousers','F2');

INSERT INTO ARTICLE_LOOKUP (ARTICLE_CODE,ARTICLE_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (124611,'Longline T-Shirts','T-Shirts',30.00,'Sweat-T-Shirts','F36');

INSERT INTO ARTICLE_LOOKUP (ARTICLE_CODE,ARTICLE_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (115121,'Pastel Colored Viscose Scarf','Hats,gloves,scarves',90.00,'Accessories','F60');

COMMIT;	
	
-- ARTICLE_COLOR_LOOKUP

INSERT INTO ARTICLE_COLOR_LOOKUP (ARTICLE_CODE,COLOR_CODE,ARTICLE_LABEL,COLOR_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (189480,901,'Longline T-Shirts','White','T-Shirts',26.99,'Sweat-T-Shirts','F36');

INSERT INTO ARTICLE_COLOR_LOOKUP (ARTICLE_CODE,COLOR_CODE,ARTICLE_LABEL,COLOR_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (189481,902,'Long Short','Black','Bermudas',24.99,'City Trousers','F2');

INSERT INTO ARTICLE_COLOR_LOOKUP (ARTICLE_CODE,COLOR_CODE,ARTICLE_LABEL,COLOR_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (174553,901,'Longline T-Shirts','Black','T-Shirts',29.99,'Sweat-T-Shirts','F36');

INSERT INTO ARTICLE_COLOR_LOOKUP (ARTICLE_CODE,COLOR_CODE,ARTICLE_LABEL,COLOR_LABEL,CATEGORY,SALE_PRICE,FAMILY_NAME,FAMILY_CODE)
VALUES (158152,755,'Blazer','Chocolate 4','Day wear',118.50,'Outerwear','F50');

COMMIT;

-- SHOP_FACTS

INSERT INTO SHOP_FACTS (ID,ARTICLE_CODE,COLOR_CODE,WEEK_KEY,SHOP_CODE,MARGIN,AMOUNT_SOLD,QUANTITY_SOLD)
VALUES (89172,189480,901,263,353,125,151.99,1);
	
INSERT INTO SHOP_FACTS (ID,ARTICLE_CODE,COLOR_CODE,WEEK_KEY,SHOP_CODE,MARGIN,AMOUNT_SOLD,QUANTITY_SOLD)
VALUES (89173,189481,902,263,354,100,124.99,1);

INSERT INTO SHOP_FACTS (ID,ARTICLE_CODE,COLOR_CODE,WEEK_KEY,SHOP_CODE,MARGIN,AMOUNT_SOLD,QUANTITY_SOLD)
VALUES (89174,189479,119,263,353,247.3,501.5,1);

INSERT INTO SHOP_FACTS (ID,ARTICLE_CODE,COLOR_CODE,WEEK_KEY,SHOP_CODE,MARGIN,AMOUNT_SOLD,QUANTITY_SOLD)
VALUES (89175,189482,902,263,353,247.3,501.5,1);

INSERT INTO SHOP_FACTS (ID,ARTICLE_CODE,COLOR_CODE,WEEK_KEY,SHOP_CODE,MARGIN,AMOUNT_SOLD,QUANTITY_SOLD)
VALUES (507,115121,901,263,353,125,151.125,2);

INSERT INTO SHOP_FACTS (ID,ARTICLE_CODE,COLOR_CODE,WEEK_KEY,SHOP_CODE,MARGIN,AMOUNT_SOLD,QUANTITY_SOLD)
VALUES (609,115121,189,159,3,135,298,2);

COMMIT;

-------------------------------------------------
-- UPDATE
-------------------------------------------------

-- CALENDAR_YEAR_LOOKUP 

UPDATE CALENDAR_YEAR_LOOKUP
SET HOLIDAY_FLAG = 'y'
WHERE WEEK_KEY = 264;

UPDATE CALENDAR_YEAR_LOOKUP
SET HOLIDAY_FLAG = 'y'
WHERE WEEK_KEY = 300;

COMMIT;

-- OULTET_LOOKUP

UPDATE OUTLET_LOOKUP
SET MANAGER = 'Benjamin'
WHERE SHOP_CODE = 353;

UPDATE OUTLET_LOOKUP
SET MANAGER = 'WIlliam'
WHERE SHOP_CODE = 400;

COMMIT;	
	
-- ARTICLE_LOOKUP

UPDATE ARTICLE_LOOKUP
SET ARTICLE_LABEL = 'Long Line T-Shirt'
WHERE ARTICLE_CODE = 189480;

UPDATE ARTICLE_LOOKUP
SET ARTICLE_LABEL = 'Long Line T-Shirt'
WHERE ARTICLE_CODE = 109482;

COMMIT;
	
-- ARTICLE_COLOR_LOOKUP

UPDATE ARTICLE_COLOR_LOOKUP
SET ARTICLE_LABEL = 'Long Line T-Shirt'
WHERE ARTICLE_CODE = 189480
AND COLOR_CODE = 901;

UPDATE ARTICLE_COLOR_LOOKUP
SET ARTICLE_LABEL = 'Long Line T-Shirt'
WHERE ARTICLE_CODE = 109482
AND COLOR_CODE = 102;

COMMIT;

-- SHOP_FACTS
	
UPDATE SHOP_FACTS
SET AMOUNT_SOLD = 500
WHERE ID = 89175;

UPDATE SHOP_FACTS
SET AMOUNT_SOLD = 500
WHERE ID =10000;

COMMIT;

-------------------------------------------------
-- DELETE
-------------------------------------------------

-- CALENDAR_YEAR_LOOKUP

DELETE FROM CALENDAR_YEAR_LOOKUP WHERE WEEK_KEY = 1;

DELETE FROM CALENDAR_YEAR_LOOKUP WHERE WEEK_KEY = 263;

COMMIT;

-- OULTET_LOOKUP

DELETE FROM OUTLET_LOOKUP WHERE SHOP_CODE = 355;

DELETE FROM OUTLET_LOOKUP WHERE SHOP_CODE = 400;

COMMIT;
	
-- ARTICLE_LOOKUP

DELETE FROM ARTICLE_LOOKUP WHERE ARTICLE_CODE = 189482;

DELETE FROM ARTICLE_LOOKUP WHERE ARTICLE_CODE = 109482;

COMMIT;
	
-- ARTICLE_COLOR_LOOKUP

DELETE FROM ARTICLE_COLOR_LOOKUP WHERE ARTICLE_CODE = 189482 AND COLOR_CODE = 902;

DELETE FROM ARTICLE_COLOR_LOOKUP WHERE ARTICLE_CODE = 10482 AND COLOR_CODE = 102;

COMMIT;

-- SHOP_FACTS
	
DELETE FROM SHOP_FACTS WHERE ID = 89175;

DELETE FROM SHOP_FACTS WHERE ID = 10000;

COMMIT;
	