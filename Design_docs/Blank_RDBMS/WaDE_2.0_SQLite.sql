-- Adel Abdallah, Senior Hydroinformatics Specialist at the WSWC, Feb 2019

--This is a Data Definition Language (DDL) script that
--generates a blank schema of the Water Data Exchange Data Model (WaDE)
-- for Microsoft SQL Server database.

-- Generated by Adel Abdallah Feb, 2019 based on WaDE XML design named WaDE2.0_schema_star generated by DbWrench V4.04 @ http://www.dbwrench.com/
-- WaDE All rights reserved. See BSD 3-Clause Licence @ https://github.com/WSWCWaterDataExchange/WaDE2.0/blob/master/LICENSE 

--Use the SQLite Manager Add-on to Mozilla Firefox
--Create a new empty database. Click on the Execute SQL button and delete the text "SELECT * FROM tablename"
--Simply copy all this script and paste into this Execute SQL window
--Then click Run SQL. The script should run successfully and create the 41 empty tables of WaDE

--------------------------------------------------------------------------------------------------
/***************************************************************************/
/*********************** CREATE WADE2.0_SCHEMA_STAR ************************/
/***************************************************************************/

CREATE TABLE AggregatedAmounts (
	AggregatedAmountID INTEGER   NOT NULL PRIMARY KEY,
	OrganizationID	 INTEGER   NOT NULL,
	ReportingUnitID INTEGER   NOT NULL,
	VariableSpecificID INTEGER   NOT NULL,
	WaterSourceID INTEGER   NOT NULL,
	MethodID INTEGER   NOT NULL,
	AmountMetadataID INTEGER   NOT NULL,
	TimeID INTEGER   NOT NULL,
	Amount FLOAT   NOT NULL,
	FOREIGN KEY (AmountMetadataID) REFERENCES AmountMetadata (AmountMetadataID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (OrganizationID	) REFERENCES Organizations (OrganizationID	)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReportingUnitID) REFERENCES ReportingUnits (ReportingUnitID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TimeID) REFERENCES Time_dim (TimeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableSpecificID) REFERENCES Variables (VariableSpecificID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (WaterSourceID) REFERENCES WaterSources (WaterSourceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE AllocationAmounts (
	AllocationAmountID INTEGER   NOT NULL PRIMARY KEY,
	OrganizationID	 INTEGER   NOT NULL,
	AllocationID INTEGER   NOT NULL,
	SiteID INTEGER   NOT NULL,
	VariableSpecificID INTEGER   NOT NULL,
	WaterSourceID INTEGER   NOT NULL,
	MethodID INTEGER   NOT NULL,
	AmountMetadataID INTEGER   NULL,
	TimeID INTEGER   NOT NULL,
	AllocationDutyAmount FLOAT   NULL,
	AllocationAmount FLOAT   NOT NULL,
	AllocationMaximum FLOAT   NULL,
	FOREIGN KEY (AmountMetadataID) REFERENCES AmountMetadata (AmountMetadataID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (OrganizationID	) REFERENCES Organizations (OrganizationID	)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SiteID) REFERENCES Sites (SiteID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TimeID) REFERENCES Time_dim (TimeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableSpecificID) REFERENCES Variables (VariableSpecificID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AllocationID) REFERENCES Allocations (AllocationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (WaterSourceID) REFERENCES WaterSources (WaterSourceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Allocations (
	AllocationID INTEGER   NOT NULL PRIMARY KEY,
	NativeAllocationID VARCHAR (250)  NULL,
	AllocationUID VARCHAR (50)  NOT NULL,
	AllocationOwner VARCHAR (255)  NOT NULL,
	AllocationApplicationDate DATE   NULL,
	AllocationPriorityDate DATE   NOT NULL,
	AllocationLegalStatusCodeCV VARCHAR (50)  NOT NULL,
	AllocationExpirationDate DATE   NULL,
	AllocationChangeApplicationIndicator VARCHAR (100)  NULL,
	LegacyAllocationIDs VARCHAR (100)  NULL,
	AllocationBasisCV INTEGER   NULL,
	AllocationAcreage INTEGER   NULL
);

CREATE TABLE AmountMetadata (
	AmountMetadataID INTEGER   NOT NULL PRIMARY KEY,
	BeneficialUseCategory VARCHAR (255)  NULL,
	PrimaryUseCategory VARCHAR (255)  NULL,
	USGSCategoryCV VARCHAR (255)  NULL,
	SDWISIdentifier VARCHAR (255)  NULL,
	NAICSCodeCV VARCHAR (255)  NULL,
	PopulationServed FLOAT   NULL,
	IrrigatedAcreage FLOAT   NULL,
	IrrigationMethod VARCHAR (100)  NULL,
	CropType VARCHAR (100)  NULL,
	PowerGeneratedGWh FLOAT   NULL,
	Geometry BLOB   NULL,
	InterbasinTransferFromID VARCHAR (50)  NULL,
	InterbasinTransferToID VARCHAR (255)  NULL
);

CREATE TABLE CVs_AggregationStatistic (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_EPSGCode (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_GNISCode (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_LegalStatusCode (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_MethodType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_NAICSCode (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_NHDNetworkStatus (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_NHDProduct (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_RegulatoryStatus (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_ReportingUnitType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_ReportYearCV (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_ReportYearType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_Units (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_USGSCategory (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_Variable (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_VerticalDatumEPSGCode (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_WaterAllocationBasis (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_WaterAllocationBasis_dup (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_WaterQualityIndicator (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE CVs_WaterSourceType (
	Name VARCHAR (255)  NOT NULL PRIMARY KEY,
	Term VARCHAR (255)  NOT NULL,
	Definition VARCHAR (5000)  NULL,
	Category VARCHAR (255)  NULL,
	SourceVocabularyURI	 VARCHAR (255)  NULL
);

CREATE TABLE Methods (
	MethodID INTEGER   NOT NULL PRIMARY KEY,
	MethodUID VARCHAR (100)  NOT NULL,
	MethodName VARCHAR (50)  NOT NULL,
	MethodDescription TEXT   NOT NULL,
	MethodNEMILink VARCHAR (100)  NULL,
	ApplicableResourceTypeCV VARCHAR (100)  NOT NULL,
	MethodTypeCV VARCHAR (50)  NOT NULL,
	DataCoverageValue VARCHAR (100)  NULL,
	DataQualityValueCV VARCHAR (50)  NULL,
	DataConfidenceValue VARCHAR (50)  NULL
);

CREATE TABLE NHDMetadata (
	NHDMetadataID INTEGER   NOT NULL PRIMARY KEY,
	NHDNetworkStatusCV VARCHAR (50)  NOT NULL,
	NHDProductCV VARCHAR (50)  NULL,
	NHDUpdateDate DATE   NULL,
	NHDReachCode VARCHAR (50)  NULL,
	NHDMeasureNumber VARCHAR (50)  NULL
);

CREATE TABLE Organizations (
	OrganizationID	 INTEGER   NOT NULL PRIMARY KEY,
	OrganizationUID VARCHAR (255)  NOT NULL,
	OrganizationName VARCHAR (255)  NOT NULL,
	OrganizationPurview VARCHAR (255)  NULL,
	OrganizationWebsite VARCHAR (255)  NULL,
	OrganizationPhoneNumber VARCHAR (255)  NULL,
	OrganizationContactName VARCHAR (255)  NULL,
	OrganizationContactEmail VARCHAR (255)  NULL
);

CREATE TABLE RegulatoryOverlay (
	RegulatoryOverlayID INTEGER   NOT NULL PRIMARY KEY,
	NativeRegulatoryOverlayID VARCHAR (255)  NULL,
	RegulatoryOverlayUID VARCHAR (255)  NULL,
	RegulatoryName VARCHAR (50)  NOT NULL,
	RegulatoryDescription TEXT   NOT NULL,
	RegulatoryStatusCV VARCHAR (50)  NOT NULL,
	OversightAgency VARCHAR (250)  NOT NULL,
	RegulatoryStatute VARCHAR (500)  NULL,
	RegulatoryStatuteLink VARCHAR (500)  NULL,
	TimeframeStart DATE   NOT NULL,
	TimeframeEnd DATE   NOT NULL,
	ReportYearTypeCV VARCHAR (10)  NOT NULL,
	ReportYearStartMonth VARCHAR (5)  NOT NULL
);

CREATE TABLE RegulatoryReportingUnits (
	BridgeID INTEGER   NOT NULL PRIMARY KEY,
	RegulatoryOverlayID INTEGER   NOT NULL,
	OrganizationID	 INTEGER   NOT NULL,
	ReportingUnitID INTEGER   NOT NULL,
	ReportYearCV VARCHAR (4)  NULL,
	DataPublicationDate DATE   NOT NULL,
	FOREIGN KEY (OrganizationID	) REFERENCES Organizations (OrganizationID	)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (RegulatoryOverlayID) REFERENCES RegulatoryOverlay (RegulatoryOverlayID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (ReportingUnitID) REFERENCES ReportingUnits (ReportingUnitID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE ReportingUnits (
	ReportingUnitID INTEGER   NOT NULL PRIMARY KEY,
	ReportingUnitNativeID VARCHAR (250)  NULL,
	ReportingUnitUID VARCHAR (255)  NOT NULL,
	ReportingUnitName VARCHAR (255)  NOT NULL,
	ReportingUnitTypeCV VARCHAR (20)  NOT NULL,
	ReportingUnitUpdateDate DATE   NULL,
	ReportingUnitProductVersion VARCHAR (100)  NULL,
	StateCV VARCHAR (50)  NOT NULL,
	EPSGCodeCV VARCHAR (50)  NULL,
	VerticalDatumEPSGCodeCV VARCHAR (50)  NULL,
	Geometry BLOB   NULL
);

CREATE TABLE Sites (
	SiteID INTEGER   NOT NULL PRIMARY KEY,
	SiteUID VARCHAR (55)  NOT NULL,
	NativeSiteID VARCHAR (50)  NULL,
	SiteName VARCHAR (500)  NOT NULL,
	SiteTypeCV VARCHAR (100)  NULL,
	Longitude VARCHAR (50)  NOT NULL,
	Latitude VARCHAR (50)  NOT NULL,
	Geometry BLOB   NULL,
	VerticalDatumEPSGCodeCV VARCHAR (50)  NOT NULL,
	CoordinateMethodCV VARCHAR (100)  NOT NULL,
	CoordinateAccuracy VARCHAR (255)  NULL,
	GNISCodeCV VARCHAR (50)  NULL,
	NHDMetadataID INTEGER   NULL,
	FOREIGN KEY (NHDMetadataID) REFERENCES NHDMetadata (NHDMetadataID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE SiteVariableAmounts (
	SiteVariableAmountID INTEGER   NOT NULL PRIMARY KEY,
	OrganizationID	 INTEGER   NOT NULL,
	AllocationID INTEGER   NULL,
	SiteID INTEGER   NOT NULL,
	VariableSpecificID INTEGER   NOT NULL,
	WaterSourceID INTEGER   NOT NULL,
	MethodID INTEGER   NOT NULL,
	AmountMetadataID INTEGER   NULL,
	TimeID INTEGER   NOT NULL,
	Amount FLOAT   NOT NULL,
	FOREIGN KEY (AmountMetadataID) REFERENCES AmountMetadata (AmountMetadataID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (MethodID) REFERENCES Methods (MethodID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (OrganizationID	) REFERENCES Organizations (OrganizationID	)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (SiteID) REFERENCES Sites (SiteID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (TimeID) REFERENCES Time_dim (TimeID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (VariableSpecificID) REFERENCES Variables (VariableSpecificID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (AllocationID) REFERENCES Allocations (AllocationID)
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (WaterSourceID) REFERENCES WaterSources (WaterSourceID)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE Time_dim (
	TimeID INTEGER   NOT NULL PRIMARY KEY,
	ReportYearCV VARCHAR (4)  NOT NULL,
	TimeframeStart DATE   NOT NULL,
	TimeframeEnd DATE   NOT NULL,
	DataPublicationDate DATE   NOT NULL
);

CREATE TABLE Variables (
	VariableSpecificID INTEGER   NOT NULL PRIMARY KEY,
	VariableSpecificUID VARCHAR (255)  NULL,
	VariableSpecificCV VARCHAR (255)  NOT NULL,
	VariableCV VARCHAR (255)  NOT NULL,
	AggregationStatisticCV VARCHAR (50)  NULL,
	AggregationInterval  NUMERIC (10)  NULL,
	AggregationIntervalUnitCV  VARCHAR (50)  NULL,
	ReportYearStartMonth  VARCHAR (10)  NULL,
	ReportYearTypeCV  VARCHAR (10)  NULL,
	AmountUnitCV VARCHAR (10)  NULL,
	MaximumAmountUnitCV NUMERIC (10)  NULL
);

CREATE TABLE WaterSources (
	WaterSourceID INTEGER   NOT NULL PRIMARY KEY,
	WaterSourceUID VARCHAR (100)  NOT NULL,
	WaterSourceNativeID VARCHAR (255)  NULL,
	WaterSourceName VARCHAR (255)  NULL,
	WaterSourceTypeCV VARCHAR (100)  NOT NULL,
	WaterQualityIndicatorCV VARCHAR (100)  NOT NULL,
	Geometry BLOB   NULL,
	GNISFeatureNameCV VARCHAR (255)  NULL
);
