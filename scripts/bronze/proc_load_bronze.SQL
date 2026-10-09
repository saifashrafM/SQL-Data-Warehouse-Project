
/*
  Stored PROCEDURE : Load Bronze layer 
  Script Purpose:
	  This script used for loading data into bronze layer tables from CSVs files ,
	  Perform 2 actiones:
	  first Truncate tables to prevevt dupliactes data.
	  second laod data using BULK INSERT 
	

   Uasge Example:
	EXEC bronze.load_bronze
*/


--============================================
--Load Data From CSVs files Using BULK INSERT 
--============================================

CREATE OR ALTER PROC bronze.load_bronze AS 
BEGIN 
	DECLARE @start_time DATETIME , @end_time DATETIME , @batch_start_time DATETIME, @batch_end_time DATETIME
	SET @batch_start_time=GETDATE();
	BEGIN TRY
		
		PRINT'#########################################################';
		PRINT '**Loading Data into bronze Layer** ';
		PRINT'#########################################################';

		PRINT '1- Loading CRM Tables from CSVs files  ';
		PRINT'-----------------------------------------------------------';

		SET @start_time=GETDATE();

		PRINT 'TRUNCATING Table bronze.crm_cst_info';
		TRUNCATE TABLE [bronze].[crm_cst_info]

		PRINT 'INSERTING Data into Table bronze.crm_cst_info';
		BULK INSERT [bronze].[crm_cst_info]
		FROM 'D:\sql-ultimate-course-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		WITH 
		(
			FIRSTROW =2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		SET @end_time=GETDATE();
		PRINT '>>> Loading Time = '+ CAST(DATEDIFF(millisecond,@start_time,@end_time) AS VARCHAR )+ ' ms';

		----------------------------------------------------------------------------------------------

		SET @start_time=GETDATE();

		PRINT 'TRUNCATING Table bronze.crm_prd_info';
		TRUNCATE TABLE [bronze].[crm_prd_info]

		PRINT 'INSERTING Data into Table bronze.crm_prd_info';
		BULK INSERT [bronze].[crm_prd_info]
		FROM 'D:\sql-ultimate-course-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		WITH 
		(
			FIRSTROW =2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		SET @end_time=GETDATE();
		PRINT '>>> Loading Time = '+ CAST(DATEDIFF(millisecond,@start_time,@end_time) AS VARCHAR )+ ' ms';

		----------------------------------------------------------------------------------------------

		SET @start_time=GETDATE();

		PRINT 'TRUNCATING Table bronze.crm_sales_details';
		TRUNCATE TABLE [bronze].[crm_sales_details]

		PRINT 'INSERTING Data into Table bronze.crm_sales_details'
		BULK INSERT [bronze].[crm_sales_details]
		FROM 'D:\sql-ultimate-course-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		WITH 
		(
			FIRSTROW =2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		SET @end_time=GETDATE();
		PRINT '>>> Loading Time = '+ CAST(DATEDIFF(millisecond,@start_time,@end_time) AS VARCHAR )+ ' ms';


		PRINT'-----------------------------------------------------------';
		PRINT '2- Loading ERP Tables from CSVs files  ';
		PRINT'-----------------------------------------------------------';
		----------------------------------------------------------------------------------------------
		-- ERP SOURCE --

		SET @start_time=GETDATE();

		PRINT 'TRUNCATING Table bronze.erp_cust_az12';

		TRUNCATE TABLE [bronze].[erp_cust_az12]

		PRINT 'INSERTING Data into Table bronze.erp_cust_az12'
		BULK INSERT [bronze].[erp_cust_az12]
		FROM 'D:\sql-ultimate-course-main\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
		WITH 
		(
			FIRSTROW =2,
			FIELDTERMINATOR =',',
			TABLOCK
		);
	
		SET @end_time=GETDATE();
		PRINT '>>> Loading Time = '+ CAST(DATEDIFF(millisecond,@start_time,@end_time) AS VARCHAR )+ ' ms';

	----------------------------------------------------------------------------------------------
		SET @start_time=GETDATE();

		PRINT 'TRUNCATING Table bronze.erp_loc_a101';

		TRUNCATE TABLE [bronze].[erp_loc_a101]

		PRINT 'INSERTING Data into Table bronze.erp_loc_a101'
		BULK INSERT [bronze].[erp_loc_a101]
		FROM 'D:\sql-ultimate-course-main\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
		WITH 
		(
			FIRSTROW =2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		SET @end_time=GETDATE();
		PRINT '>>> Loading Time = '+ CAST(DATEDIFF(millisecond,@start_time,@end_time) AS VARCHAR )+ ' ms';

	----------------------------------------------------------------------------------------------
		SET @start_time=GETDATE();

		PRINT 'TRUNCATING Table bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE [bronze].[erp_px_cat_g1v2]

		PRINT 'INSERTING Data into Table bronze.erp_px_cat_g1v2'
		BULK INSERT [bronze].[erp_px_cat_g1v2]
		FROM 'D:\sql-ultimate-course-main\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH 
		(
			FIRSTROW =2,
			FIELDTERMINATOR =',',
			TABLOCK
		);

		SET @end_time=GETDATE();
		PRINT '>>> Loading Time = '+ CAST(DATEDIFF(millisecond,@start_time,@end_time) AS VARCHAR )+ ' ms';


	SET @batch_end_time= GETDATE();

	PRINT '';
	PRINT '--------------------------------------------------------------------';
	PRINT 'Loading Bronz Layer is Completted  ';
	PRINT '    - Total Loading Time  for Batch = '+ CAST(DATEDIFF(millisecond,@batch_start_time,@batch_end_time) AS VARCHAR )+ ' ms';
	PRINT '--------------------------------------------------------------------';
	END TRY
	BEGIN CATCH 
		PRINT 'ERROR Occure During Loading Data';
		PRINT 'ERROR Message : '+ERROR_MESSAGE();
		PRINT 'ERROR Number : '+ CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR State : '+ERROR_STATE();
	END CATCH 



END;


