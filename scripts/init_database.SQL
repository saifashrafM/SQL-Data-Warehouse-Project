/*
===============================================================================
Script Name: Create Data Warehouse Database
Script Purpose:
    This script creates the DataWarehouse database and its schemas.

    If the database already exists, it will be dropped and recreated.
    The script creates the following schemas:
        - bronze
        - silver
        - gold

WARNING:
    Running this script will permanently delete the existing DataWarehouse
    database, including all its tables and data, before recreating it.
    Make sure you understand the consequences before executing this script.
===============================================================================
*/

USE master;

IF EXISTS ( SELECT 1 FROM sys.databases WHERE name ='DataWarehouse')
BEGIN 
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE ;
	DROP DATABASE DataWarehouse;
END;
GO 

-- create Database --
CREATE DATABASE DataWarehouse;

USE DataWarehouse;


--CREATE Schemas 
GO
CREATE SCHEMA bronze;


GO
CREATE SCHEMA silver;


GO
CREATE SCHEMA gold;


GO 
