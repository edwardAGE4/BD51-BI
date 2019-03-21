USE EMODE;
GO

CREATE TABLE AGG_YR_FP_YW_MO_TI_RV_MA_QT (
	WEEK_KEY    numeric(3, 0)   NOT NULL,
	YEAR        numeric(4, 0)   NULL,
	FISC        varchar(4)      NULL,
	YEAR_WE     varchar(7)      NULL,
	MONTH       numeric(2, 0)   NULL,
	MONTH_NAME  varchar(10)     NULL,
	TICKETS     int             NULL,
	RV          numeric(38, 2)  NULL,
	MARGE       numeric(38, 2)  NULL,
	QTE         numeric(38, 2)  NULL
);

CREATE TABLE AGG_YR_FP_YW_TI_RV_MA_QT (
	WEEK_KEY    numeric(3, 0)   NOT NULL,
	YEAR        numeric(4, 0)   NULL,
	FISC        varchar(4)      NULL,
	YEAR_WE     varchar(7)      NULL,
	TICKETS     int             NULL,
	RV          numeric(38, 2)  NULL,
	MARGE       numeric(38, 2)  NULL,
	QTE         numeric(38, 2)  NULL
);