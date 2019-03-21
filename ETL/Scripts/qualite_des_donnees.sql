--------------------------------------------------------------------------------
/* 1- Vérification des clé primaires */
--------------------------------------------------------------------------------

SELECT
	'ARTICLE_LOOKUP' as TAB,
	COUNT(article_code) as PK_LINES,
	COUNT(DISTINCT article_code) as DISTINCK_PK_LINES
FROM article_lookup
WHERE article_code IS NOT NULL
UNION

SELECT
	'ARTICLE_COLOR_LOOKUP' as TAB,
	COUNT(CONCAT(cast(ARTICLE_code as char(6)),cast(COLOR_CODE as char(4)))) as PK_LINES,
	COUNT(DISTINCT CONCAT(to_char(ARTICLE_CODE),to_char(COLOR_CODE)))
FROM ARTICLE_COLOR_LOOKUP
WHERE article_code IS NOT NULL
AND COLOR_CODE IS NOT NULL
UNION

SELECT
	'CALENDAR_YEAR_LOOKUP' as TAB,
	COUNT(WEEK_KEY) as PK_LINES,
	COUNT(DISTINCT WEEK_KEY) as DISTINCK_PK_LINES
FROM CALENDAR_YEAR_LOOKUP
WHERE WEEK_KEY IS NOT NULL
UNION

SELECT
	'OUTLET_LOOKUP' as TAB,
	COUNT(shop_code) as PK_LINES,
	COUNT(DISTINCT SHOP_CODE) as DISTINCK_PK_LINES
FROM OUTLET_LOOKUP
WHERE shop_code IS NOT NULL
UNION

SELECT
	'SHOP_FACTS' as TAB,
	COUNT(ID) as PK_LINES,
	COUNT(DISTINCT ID) as DISTINCK_PK_LINES
FROM SHOP_FACTS
WHERE ID IS NOT NULL;

--------------------------------------------------------------------------------
/* 2- Identification des clés primaires en double */
--------------------------------------------------------------------------------

SELECT 
  count(*) as nombre_enregistrements
  ,count(distinct concat(to_char(article_code),to_char(color_code))) as identifiants
  ,article_code
  ,color_code
FROM
  ARTICLE_COLOR_LOOKUP
GROUP BY 
  color_code
  ,article_code
HAVING 
  count(*)>1
;

--------------------------------------------------------------------------------
/* 3-  */
--------------------------------------------------------------------------------
SELECT
   COUNT( DISTINCT CONCAT(to_char(article_code),to_char(color_code))) AS "Occurrences"
  ,article_code
  ,color_code
FROM
   SHOP_FACTS
WHERE
   CONCAT(to_char(article_code),to_char(color_code)) not in 
  (
    SELECT
     CONCAT(to_char(article_code),to_char(color_code))
    FROM 
      ARTICLE_COLOR_LOOKUP
    
  )
GROUP BY 
  article_code
  ,color_code
;

--------------------------------------------------------------------------------
/*Clé primaire et étrangères*/
--------------------------------------------------------------------------------
------ADD PRIMARY KEY ALTER COMMAND
alter table article_color_lookup 
add constraint PK_ARTICLE_COLOR_LOOKUP
primary key(article_code,color_code);

alter table calendar_year_lookup 
add constraint PK_CALENDAR_YEAR_LOOKUP
primary key(week_key);

alter table outlet_lookup 
add constraint PK_OUTLET_LOOKUP
primary key(shop_code);

alter table article_lookup 
add constraint PK_ARTICLE_LOOKUP
primary key(article_code);

alter table shop_facts 
add constraint PK_SHOP_FACTS
primary key(id);


------ADD FOREIGN KEY ALTER COMMAND SHOP FACTS

alter table shop_facts 
add constraint FK_ARTICLE_COLOR_LOOKUP
foreign key(article_code,color_code) references article_color_lookup(article_code,color_code);

alter table shop_facts 
add constraint FK_CALENDAR_YEAR_LOOKUP
foreign key(week_key) references calendar_year_lookup(week_key);

alter table shop_facts 
add constraint FK_OUTLET_LOOKUP
foreign key(shop_code) references outlet_lookup(shop_code);

alter table shop_facts
add constraint FK_ARTICLE_LOOKUP
foreign key(article_code) references article_lookup(article_code);