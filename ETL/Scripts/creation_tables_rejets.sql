--------------------------------------------------------------------------------
/* Création avec insertion des tables de rejets dans la base source (Oracle)  */
--------------------------------------------------------------------------------

-- For ARTICLE_LOOKUP
SELECT
    AL.ARTICLE_CODE
  , AL.ARTICLE_LABEL
  , AL.CATEGORY
  , AL.SALE_PRICE
  , AL.FAMILY_NAME
  , AL.FAMILY_CODE INTO ARTICLE_LOOKUP_REJECT
FROM
    ARTICLE_LOOKUP AL
WHERE
	AL.ARTICLE_CODE IN(  
				SELECT 
                    AL2.ARTICLE_CODE 		 
                FROM
					ARTICLE_LOOKUP AL2
                GROUP BY 
					AL2.ARTICLE_CODE
                HAVING
					COUNT(AL2.ARTICLE_CODE)>1);
					
-- For ARTICLE_COLOR_LOOKUP
SELECT
    ACL.ARTICLE_CODE
  , ACL.COLOR_CODE
  , ACL.ARTICLE_LABEL
  , ACL.COLOR_LABEL
  , ACL.CATEGORY
  , ACL.SALE_PRICE
  , ACL.FAMILY_NAME
  , ACL.FAMILY_CODE INTO ARTICLE_COLOR_LOOKUP_REJECT
FROM
    ARTICLE_COLOR_LOOKUP ACL
WHERE
	CONCAT(ACL.ARTICLE_CODE,ACL.COLOR_CODE) IN(  
				SELECT 
                    CONCAT(ACL2.ARTICLE_CODE,ACL2.COLOR_CODE)		 
                FROM
					ARTICLE_COLOR_LOOKUP ACL2
                GROUP BY 
					CONCAT(ACL2.ARTICLE_CODE,ACL2.COLOR_CODE)
                HAVING
					COUNT(CONCAT(ACL2.ARTICLE_CODE,ACL2.COLOR_CODE))>1);
			
-- For CALENDAR_YEAR_LOOKUP
SELECT
	CYL.WEEK_KEY					
  , CYL.WEEK_IN_YEAR			
  , CYL."YEAR"		
  , CYL.FISCAL_PERIOD				
  , CYL.YEAR_WEEK	
  , CYL.QUARTER
  , CYL.MONTH_NAME 		
  , CYL."MONTH" 		
  , CYL.HOLIDAY_FLAG INTO CALENDAR_YEAR_LOOKUP_REJECT
FROM
    CALENDAR_YEAR_LOOKUP CYL
WHERE
	CYL.WEEK_KEY IN(  
					SELECT 
						CYL2.WEEK_KEY 		 
					FROM
						CALENDAR_YEAR_LOOKUP CYL2
					GROUP BY 
						CYL2.WEEK_KEY 
					HAVING
						COUNT(CYL2.WEEK_KEY )>1);
						
-- For OUTLET_LOOKUP		
SELECT
	OL.SHOP_NAME 		
  , OL.ADDRESS_1		
  , OL.MANAGER		 	
  , OL.DATE_OPEN 		
  , OL."OPEN" 			
  , OL.OWNED_OUTRIGHT 	
  , OL.FLOOR_SPACE 	
  , OL.ZIP_CODE		
  , OL.CITY			
  , OL."STATE" 		
  , OL.SHOP_CODE INTO OUTLET_LOOKUP_REJECT
FROM
    OUTLET_LOOKUP OL
WHERE
	OL.SHOP_CODE IN(  
					SELECT 
						OL2.SHOP_CODE 		 
					FROM
						OUTLET_LOOKUP OL2
					GROUP BY 
						OL2.SHOP_CODE 
					HAVING
						COUNT(OL2.SHOP_CODE)>1);

-- For SHOP_FACTS
SELECT 
    SF.ID
  , SF.ARTICLE_CODE
  , SF.COLOR_CODE
  , SF.WEEK_KEY
  , SF.SHOP_CODE
  , SF.MARGIN
  , SF.AMOUNT_SOLD
  , SF.QUANTITY_SOLD INTO SHOP_FACTS_REJECT
  FROM
    SHOP_FACTS SF
  WHERE
	SF.ID IN(  
				SELECT 
					SF2.ID 		 
				FROM
					SHOP_FACTS SF2
				GROUP BY 
					SF2.ID
				HAVING
					COUNT(SF2.ID)>1)
  ORDER BY
	1 ASC;

-- For SHOP_FACTS from CALENDAR_YEAR_LOOKUP
INSERT INTO EMODE.SHOP_FACTS_REJECT(
    ID
  , ARTICLE_CODE
  , COLOR_CODE
  , WEEK_KEY
  , SHOP_CODE
  , MARGIN
  , AMOUNT_SOLD
  , QUANTITY_SOLD)
SELECT 
    SF.ID
  , SF.ARTICLE_CODE
  , SF.COLOR_CODE
  , SF.WEEK_KEY
  , SF.SHOP_CODE
  , SF.MARGIN
  , SF.AMOUNT_SOLD
  , SF.QUANTITY_SOLD 
  FROM
    SHOP_FACTS SF
  WHERE
    SF.WEEK_KEY NOT IN (
      SELECT
        DISTINCT CYL.WEEK_KEY	
      FROM
        CALENDAR_YEAR_LOOKUP CYL
   )
ORDER BY
	1 ASC;

-- For SHOP_FACTS from OUTLET_LOOKUP
INSERT INTO EMODE.SHOP_FACTS_REJECT(
    ID
  , ARTICLE_CODE
  , COLOR_CODE
  , WEEK_KEY
  , SHOP_CODE
  , MARGIN
  , AMOUNT_SOLD
  , QUANTITY_SOLD)
SELECT 
    SF.ID
  , SF.ARTICLE_CODE
  , SF.COLOR_CODE
  , SF.WEEK_KEY
  , SF.SHOP_CODE
  , SF.MARGIN
  , SF.AMOUNT_SOLD
  , SF.QUANTITY_SOLD 
  FROM
    SHOP_FACTS SF
  WHERE
    SF.SHOP_CODE NOT IN (
      SELECT
        DISTINCT OL.SHOP_CODE	
      FROM
        OUTLET_LOOKUP OL
    )
	AND SF.SHOP_CODE NOT IN (
      SELECT
        DISTINCT UOLF.SHOP_CODE	
      FROM
        UNUSED_OUTLET_LOOKUP_FULL UOLF
    )
ORDER BY
	1 ASC; 
	
-- For SHOP_FACTS from ARTICLE_COLOR_LOOKUP
INSERT INTO EMODE.SHOP_FACTS_REJECT(
    ID
  , ARTICLE_CODE
  , COLOR_CODE
  , WEEK_KEY
  , SHOP_CODE
  , MARGIN
  , AMOUNT_SOLD
  , QUANTITY_SOLD)
SELECT 
    SF.ID
  , SF.ARTICLE_CODE
  , SF.COLOR_CODE
  , SF.WEEK_KEY
  , SF.SHOP_CODE
  , SF.MARGIN
  , SF.AMOUNT_SOLD
  , SF.QUANTITY_SOLD 
FROM
    SHOP_FACTS SF
WHERE
   CONCAT(SF.COLOR_CODE,SF.ARTICLE_CODE) NOT IN (
      SELECT
        DISTINCT CONCAT(ACL.COLOR_CODE,ACL.ARTICLE_CODE)	
      FROM
        ARTICLE_COLOR_LOOKUP ACL
   )
   OR SF.ARTICLE_CODE NOT IN (
       SELECT
        DISTINCT AL.ARTICLE_CODE
      FROM
        ARTICLE_LOOKUP AL
   )
ORDER BY
	1 ASC;



--------------------------------------------------------------------------------
/* Création des tables de rejets dans la base de destination (SQL Server)     */
--------------------------------------------------------------------------------
SELECT * INTO REJ_ARTICLE_LOOKUP FROM ARTICLE_LOOKUP WHERE 1=2;
SELECT * INTO REJ_ARTICLE_COLOR_LOOKUP FROM ARTICLE_COLOR_LOOKUP WHERE 1=2;
SELECT * INTO REJ_CALENDAR_YEAR_LOOKUP FROM CALENDAR_YEAR_LOOKUP WHERE 1=2;
SELECT * INTO REJ_OUTLET_LOOKUP FROM OUTLET_LOOKUP WHERE 1=2;
SELECT * INTO REJ_SHOP_FACTS FROM SHOP_FACTS WHERE 1=2;






















					