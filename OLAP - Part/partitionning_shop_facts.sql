--Implementation du partitionnement
			--Création des File groupe
				
				ALTER DATABASE emode ADD FILEGROUP emod_part_1999;
				ALTER DATABASE emode ADD FILEGROUP emod_part_2000;
				ALTER DATABASE emode ADD FILEGROUP emod_part_2001;
				ALTER DATABASE emode ADD FILEGROUP emod_part_2002; 
				ALTER DATABASE emode ADD FILEGROUP emod_part_2003; 
				ALTER DATABASE emode ADD FILEGROUP emod_part_ap_2003;
			
			--Verification
				select * from sys.filegroups;
				
			--Ajout de fichiers aux files groupes
			
					ALTER DATABASE emode ADD FILE (NAME =emod_part_1999_fil1,
					FILENAME = 'C:\Program Files\Microsoft SQL Server 2016\MSSQL13.SQL2016\MSSQL\DATA\emod_part_1999_f1.ndf' 
					,   SIZE = 1MB,  MAXSIZE = 5MB,   FILEGROWTH = 2MB)
					TO FILEGROUP emod_part_1999_f1 
					
					ALTER DATABASE emode ADD FILE (NAME =emod_part_2000_fil1,
					FILENAME = 'C:\Program Files\Microsoft SQL Server 2016\MSSQL13.SQL2016\MSSQL\DATA\emod_part_2000_f1.ndf' 
					,   SIZE = 1MB,  MAXSIZE = 5MB,   FILEGROWTH = 2MB)
					TO FILEGROUP emod_part_2000

					ALTER DATABASE emode ADD FILE (NAME =emod_part_2001_fil1,
					FILENAME = 'C:\Program Files\Microsoft SQL Server 2016\MSSQL13.SQL2016\MSSQL\DATA\emod_part_2001_f1.ndf' 
					,   SIZE = 1MB,  MAXSIZE = 5MB,   FILEGROWTH = 2MB)
					TO FILEGROUP emod_part_2001
					
					ALTER DATABASE emode ADD FILE (NAME =emod_part_2002_fil1,
					FILENAME = 'C:\Program Files\Microsoft SQL Server 2016\MSSQL13.SQL2016\MSSQL\DATA\emod_part_2002_f1.ndf' 
					,   SIZE = 1MB,  MAXSIZE = 5MB,   FILEGROWTH = 2MB)
					TO FILEGROUP emod_part_2002 
			
					ALTER DATABASE emode ADD FILE (NAME =emod_part_2003_fil1,
					FILENAME = 'C:\Program Files\Microsoft SQL Server 2016\MSSQL13.SQL2016\MSSQL\DATA\emod_part_2003_f1.ndf' 
					,   SIZE = 1MB,  MAXSIZE = 5MB,   FILEGROWTH = 2MB)
					TO FILEGROUP emod_part_2003 
			
					ALTER DATABASE emode ADD FILE (NAME = emod_part_ap_2003_fil1,
					FILENAME = 'C:\Program Files\Microsoft SQL Server 2016\MSSQL13.SQL2016\MSSQL\DATA\emod_part_ap_2003_f1.ndf'
					, SIZE = 1MB,  MAXSIZE = 5MB,   FILEGROWTH = 2MB)
					TO FILEGROUP emod_part_ap_2003

					
					
			--Fonction de partitionnement
			    use emode
				go
				CREATE PARTITION FUNCTION Week_keyRangePFN(NUMERIC(3,0)) 
					AS RANGE LEFT FOR VALUES (52,104,156,209,262);
			--Schema de partionnement
			use emode
			go
				CREATE PARTITION SCHEME Week_KeyRangeSCH AS PARTITION Week_keyRangePFN 
				TO ( emod_part_1997,emod_part_1998,emod_part_1999,  emod_part_1999,  emod_part_2000, emod_part_2001,emod_part_av_1990, emod_part_ap_2001)
				
			--Recréer la table shop_facts en tenant compte du schema de partitionnement
				CREATE TABLE SHOP_FACTS
					(
					 ID NUMERIC (5,0) NOT NULL , 
					 ARTICLE_CODE NUMERIC (6,0) , 
					 COLOR_CODE NUMERIC (4,0) , 
					 WEEK_KEY NUMERIC (3,0) NOT NULL, 
					 SHOP_CODE NUMERIC (3,0), 
					 MARGIN NUMERIC (18,0) , 
					 AMOUNT_SOLD NUMERIC (13,2) , 
					 QUANTITY_SOLD NUMERIC (13,2), 
					)
					on Week_KeyRangeSCH(WEEK_KEY);
					
				ALTER TABLE SHOP_FACTS 
				ADD CONSTRAINT PK_SHOP_FACTS PRIMARY KEY NONCLUSTERED(ID) ON EMODE_IND_G2;
				
				ALTER TABLE SHOP_FACTS
				ADD CONSTRAINT shop_facts_article_color_lookup_fk FOREIGN KEY (ARTICLE_CODE, COLOR_CODE)
				REFERENCES ARTICLE_COLOR_LOOKUP (ARTICLE_CODE, COLOR_CODE);
				
				ALTER TABLE SHOP_FACTS 
				ADD CONSTRAINT shop_facts_article_lookup_fk FOREIGN KEY(ARTICLE_CODE)
				REFERENCES ARTICLE_LOOKUP (ARTICLE_CODE);

				ALTER TABLE SHOP_FACTS
				ADD CONSTRAINT shop_facts_calendar_year_lookup_fk FOREIGN KEY(WEEK_KEY)
				REFERENCES CALENDAR_YEAR_LOOKUP (WEEK_KEY);

				ALTER TABLE SHOP_FACTS 
				ADD CONSTRAINT shop_facts_outlet_lookup_fk FOREIGN KEY(SHOP_CODE)
				REFERENCES OUTLET_LOOKUP (SHOP_CODE);
				
		--Test de prise en compte des table de partitionnement		
				use EMODE; 
				select t.name as table_name,
					i.name as index_name,
					ds.type_desc,
					ps.name as partition_scheme_name
				from sys.tables t
				join sys.indexes i on t.object_id = i.object_id
				join sys.data_spaces ds on i.data_space_id = ds.data_space_id
				left join sys.partition_schemes ps on ps.data_space_id = ds.data_space_id