/*
DDL Script: Create Bronze tables
Script Purpose:
     this script creates tables in the 'bronze' Schema,
     and drop the tables if already exists

     Run this script to re_define the tables in bronze layer 
*/

USE DataWarehouse;

--====================================
-- Create tables for CRM source 
--====================================
--create customer table 
IF OBJECT_ID('bronze.crm_cst_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cst_info;

CREATE TABLE bronze.crm_cst_info (
    cst_id             INT          ,
    cst_key            NVARCHAR (50),
    cst_firstname      NVARCHAR (50),
    cst_lastname       NVARCHAR (50),
    cst_marital_status NVARCHAR (50),
    cst_gndr           NVARCHAR (50),
    cst_create_date    DATE         
);

--create produsts table
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT           ,
    prd_key      NVARCHAR (50) ,
    prd_nm       NVARCHAR (50) ,
    prd_cost     DECIMAL (6, 2),
    prd_line     NVARCHAR (10) ,
    prd_start_dt DATE          ,
    prd_end_dt   DATE          
);

--create sales details table 
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  VARCHAR (50)  ,
    sls_prd_key  VARCHAR (50)  ,
    sls_cust_id  INT           ,
    sls_order_dt INT           ,
    sls_ship_dt  INT           ,
    sls_due_dt   INT           ,
    sls_sales    DECIMAL (6, 2),
    sls_quantity INT           ,
    sls_price    DECIMAL (6, 2)
);

--====================================
-- Create tables for ERP  source  
--====================================

--create CUST_AZ12 table 
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    cid   VARCHAR (50) ,
    bdate DATE         ,
    gen   NVARCHAR (50)
);

--create LOC_A101 details table 
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    cid   NVARCHAR (50),
    cntry NVARCHAR (50)
);

--create PX_CAT_G1V2 details table 
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          NVARCHAR (50),
    cat         NVARCHAR (50),
    subcat      NVARCHAR (50),
    maintenance NVARCHAR (50)
);
