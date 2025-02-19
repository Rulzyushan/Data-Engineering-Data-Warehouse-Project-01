/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse'. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/
-- Step 1: Identify active connections to 'datawarehouse'
SELECT procpid, usename, datname, current_query
FROM pg_stat_activity
WHERE datname = 'datawarehouse';

-- Step 2: Terminate all active connections to 'datawarehouse'
SELECT pg_terminate_backend(procpid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse';

-- Step 3: Drop the 'datawarehouse' database
DROP DATABASE datawarehouse;

-- Step 4: Create the 'datawarehouse' database
CREATE DATABASE datawarehouse;

-- Step 5: Drop public schemas
DROP SCHEMA public;

-- Step 6: create schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
