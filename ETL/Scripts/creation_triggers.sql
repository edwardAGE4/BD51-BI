CREATE SYNONYM INC_ARTICLE_COLOR_LOOKUP FOR EMODE_INC.ARTICLE_COLOR_LOOKUP;
CREATE SYNONYM INC_ARTICLE_LOOKUP FOR EMODE_INC.ARTICLE_LOOKUP;
CREATE SYNONYM INC_CALENDAR_YEAR_LOOKUP FOR EMODE_INC.CALENDAR_YEAR_LOOKUP;
CREATE SYNONYM INC_OUTLET_LOOKUP FOR EMODE_INC.OUTLET_LOOKUP;
CREATE SYNONYM INC_SHOP_FACTS FOR EMODE_INC.SHOP_FACTS;


-- ARTICLE_COLOR_LOOKUP
-- Insert
CREATE OR REPLACE TRIGGER TRG_INS_ARTICLE_COLOR_LOOKUP AFTER INSERT ON ARTICLE_COLOR_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_ARTICLE_COLOR_LOOKUP VALUES(:NEW.ARTICLE_CODE, :NEW.COLOR_CODE, :NEW.ARTICLE_LABEL, :NEW.COLOR_LABEL, :NEW.CATEGORY, :NEW.SALE_PRICE, :NEW.FAMILY_NAME, :NEW.FAMILY_CODE, 'i');
END; 
-- Update
CREATE OR REPLACE TRIGGER TRG_UPD_ARTICLE_COLOR_LOOKUP AFTER UPDATE ON ARTICLE_COLOR_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_ARTICLE_COLOR_LOOKUP VALUES(:NEW.ARTICLE_CODE, :NEW.COLOR_CODE, :NEW.ARTICLE_LABEL, :NEW.COLOR_LABEL, :NEW.CATEGORY, :NEW.SALE_PRICE, :NEW.FAMILY_NAME, :NEW.FAMILY_CODE, 'u');
END;
-- Delete
CREATE OR REPLACE TRIGGER TRG_DEL_ARTICLE_COLOR_LOOKUP AFTER DELETE ON ARTICLE_COLOR_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_ARTICLE_COLOR_LOOKUP VALUES(:OLD.ARTICLE_CODE, :OLD.COLOR_CODE, :OLD.ARTICLE_LABEL, :OLD.COLOR_LABEL, :OLD.CATEGORY, :OLD.SALE_PRICE, :OLD.FAMILY_NAME, :OLD.FAMILY_CODE, 'd');
END; 

-- ARTICLE_LOOKUP
-- Insert
CREATE OR REPLACE TRIGGER TRG_INS_ARTICLE_LOOKUP AFTER INSERT ON ARTICLE_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_ARTICLE_LOOKUP VALUES(:NEW.ARTICLE_CODE, :NEW.ARTICLE_LABEL, :NEW.CATEGORY, :NEW.SALE_PRICE, :NEW.FAMILY_NAME, :NEW.FAMILY_CODE, 'i');
END; 
-- Update
CREATE OR REPLACE TRIGGER TRG_UPD_ARTICLE_LOOKUP AFTER UPDATE ON ARTICLE_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_ARTICLE_LOOKUP VALUES(:NEW.ARTICLE_CODE, :NEW.ARTICLE_LABEL, :NEW.CATEGORY, :NEW.SALE_PRICE, :NEW.FAMILY_NAME, :NEW.FAMILY_CODE, 'u');
END;
-- Delete
CREATE OR REPLACE TRIGGER TRG_DEL_ARTICLE_LOOKUP AFTER DELETE ON ARTICLE_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_ARTICLE_LOOKUP VALUES(:OLD.ARTICLE_CODE, :OLD.ARTICLE_LABEL, :OLD.CATEGORY, :OLD.SALE_PRICE, :OLD.FAMILY_NAME, :OLD.FAMILY_CODE, 'd');
END; 

-- CALENDAR_YEAR_LOOKUP
-- Insert
CREATE OR REPLACE TRIGGER TRG_INS_CALENDAR_YEAR_LOOKUP AFTER INSERT ON CALENDAR_YEAR_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_CALENDAR_YEAR_LOOKUP VALUES(:NEW.WEEK_KEY, :NEW.WEEK_IN_YEAR, :NEW.YEAR, :NEW.FISCAL_PERIOD, :NEW.YEAR_WEEK, :NEW.QUARTER, :NEW.MONTH_NAME, :NEW.MONTH, :NEW.HOLIDAY_FLAG, 'i');
END; 
-- Update
CREATE OR REPLACE TRIGGER TRG_UPD_CALENDAR_YEAR_LOOKUP AFTER UPDATE ON CALENDAR_YEAR_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_CALENDAR_YEAR_LOOKUP VALUES(:NEW.WEEK_KEY, :NEW.WEEK_IN_YEAR, :NEW.YEAR, :NEW.FISCAL_PERIOD, :NEW.YEAR_WEEK, :NEW.QUARTER, :NEW.MONTH_NAME, :NEW.MONTH, :NEW.HOLIDAY_FLAG, 'u');
END;
-- Delete
CREATE OR REPLACE TRIGGER TRG_DEL_CALENDAR_YEAR_LOOKUP AFTER DELETE ON CALENDAR_YEAR_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_CALENDAR_YEAR_LOOKUP VALUES(:OLD.WEEK_KEY, :OLD.WEEK_IN_YEAR, :OLD.YEAR, :OLD.FISCAL_PERIOD, :OLD.YEAR_WEEK, :OLD.QUARTER, :OLD.MONTH_NAME, :OLD.MONTH, :OLD.HOLIDAY_FLAG, 'd');
END; 

-- OUTLET_LOOKUP
-- Insert
CREATE OR REPLACE TRIGGER TRG_INS_OUTLET_LOOKUP AFTER INSERT ON OUTLET_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_OUTLET_LOOKUP VALUES(:NEW.SHOP_CODE, :NEW.SHOP_NAME, :NEW.ADDRESS_1, :NEW.MANAGER, :NEW.DATE_OPEN, :NEW.OPEN, :NEW.OWNED_OUTRIGHT, :NEW.FLOOR_SPACE, :NEW.ZIP_CODE, :NEW.CITY, :NEW.STATE, 'i');
END; 
-- Update
CREATE OR REPLACE TRIGGER TRG_UPD_OUTLET_LOOKUP AFTER UPDATE ON OUTLET_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_OUTLET_LOOKUP VALUES(:NEW.SHOP_CODE, :NEW.SHOP_NAME, :NEW.ADDRESS_1, :NEW.MANAGER, :NEW.DATE_OPEN, :NEW.OPEN, :NEW.OWNED_OUTRIGHT, :NEW.FLOOR_SPACE, :NEW.ZIP_CODE, :NEW.CITY, :NEW.STATE, 'u');
END;
-- Delete
CREATE OR REPLACE TRIGGER TRG_DEL_OUTLET_LOOKUP AFTER DELETE ON OUTLET_LOOKUP FOR EACH ROW
BEGIN
INSERT INTO INC_OUTLET_LOOKUP VALUES(:OLD.SHOP_CODE, :OLD.SHOP_NAME, :OLD.ADDRESS_1, :OLD.MANAGER, :OLD.DATE_OPEN, :OLD.OPEN, :OLD.OWNED_OUTRIGHT, :OLD.FLOOR_SPACE, :OLD.ZIP_CODE, :OLD.CITY, :OLD.STATE, 'd');
END;

-- SHOP_FACTS
-- Insert
CREATE OR REPLACE TRIGGER TRG_INS_SHOP_FACTS AFTER INSERT ON SHOP_FACTS FOR EACH ROW
BEGIN
INSERT INTO INC_SHOP_FACTS VALUES(:NEW.ID, :NEW.ARTICLE_CODE, :NEW.COLOR_CODE, :NEW.WEEK_KEY, :NEW.SHOP_CODE, :NEW.MARGIN,:NEW.AMOUNT_SOLD, :NEW.QUANTITY_SOLD, 'i');
END; 
-- Update
CREATE OR REPLACE TRIGGER TRG_UPD_SHOP_FACTS AFTER UPDATE ON SHOP_FACTS FOR EACH ROW
BEGIN
INSERT INTO INC_SHOP_FACTS VALUES(:NEW.ID, :NEW.ARTICLE_CODE, :NEW.COLOR_CODE, :NEW.WEEK_KEY, :NEW.SHOP_CODE, :NEW.MARGIN,:NEW.AMOUNT_SOLD, :NEW.QUANTITY_SOLD, 'u');
END;
-- Delete
CREATE OR REPLACE TRIGGER TRG_DEL_SHOP_FACTS AFTER DELETE ON SHOP_FACTS FOR EACH ROW
BEGIN
INSERT INTO INC_SHOP_FACTS VALUES(:OLD.ID, :OLD.ARTICLE_CODE, :OLD.COLOR_CODE, :OLD.WEEK_KEY, :OLD.SHOP_CODE, :OLD.MARGIN,:OLD.AMOUNT_SOLD, :OLD.QUANTITY_SOLD, 'd');
END; 