CREATE OR REPLACE PROCEDURE bronze.load_bronze() 
LANGUAGE plpgsql
AS
$$
BEGIN
    -- Truncate the table before loading new data
    TRUNCATE TABLE datawarehouse.bronze.crm_cust_info;

    -- Copy data from S3 to Redshift table
    COPY datawarehouse.bronze.crm_cust_info 
    FROM 's3://awsbucketdedwproject01/load/source_crm/cust_info.csv' 
    IAM_ROLE 'arn:aws:iam::#####:role/de-dw-p01-redshift-role'
    FORMAT AS CSV 
    DELIMITER ','
    QUOTE '"' 
    IGNOREHEADER 1 
    REGION 'ap-south-1';


	TRUNCATE TABLE datawarehouse.bronze.crm_prd_info;

	COPY datawarehouse.bronze.crm_prd_info
    FROM 's3://awsbucketdedwproject01/load/source_crm/prd_info.csv' 
    IAM_ROLE 'arn:aws:iam::#####:role/de-dw-p01-redshift-role'
    FORMAT AS CSV 
    DELIMITER ','
    QUOTE '"' 
    IGNOREHEADER 1 
    REGION 'ap-south-1';

		
		
	TRUNCATE TABLE datawarehouse.bronze.crm_sales_details;

	COPY datawarehouse.bronze.crm_sales_details 
    FROM 's3://awsbucketdedwproject01/load/source_crm/sales_details.csv' 
    IAM_ROLE 'arn:aws:iam::#####:role/de-dw-p01-redshift-role'
    FORMAT AS CSV 
    DELIMITER ','
    QUOTE '"' 
    IGNOREHEADER 1 
    REGION 'ap-south-1';
		
		
	TRUNCATE TABLE datawarehouse.bronze.erp_loc_a101;

	COPY datawarehouse.bronze.erp_loc_a101 
    FROM 's3://awsbucketdedwproject01/load/source_erp/LOC_A101.csv' 
    IAM_ROLE 'arn:aws:iam::#####:role/de-dw-p01-redshift-role'
    FORMAT AS CSV 
    DELIMITER ','
    QUOTE '"' 
    IGNOREHEADER 1 
    REGION 'ap-south-1';
		
	TRUNCATE TABLE datawarehouse.bronze.erp_cust_az12;

	COPY datawarehouse.bronze.erp_cust_az12 
    FROM 's3://awsbucketdedwproject01/load/source_erp/CUST_AZ12.csv' 
    IAM_ROLE 'arn:aws:iam::#####:role/de-dw-p01-redshift-role'
    FORMAT AS CSV 
    DELIMITER ','
    QUOTE '"' 
    IGNOREHEADER 1 
    REGION 'ap-south-1';
		
	TRUNCATE TABLE datawarehouse.bronze.erp_px_cat_g1v2;

	COPY datawarehouse.bronze.erp_px_cat_g1v2 
    FROM 's3://awsbucketdedwproject01/load/source_erp/PX_CAT_G1V2.csv' 
    IAM_ROLE 'arn:aws:iam::#####:role/de-dw-p01-redshift-role'
    FORMAT AS CSV 
    DELIMITER ','
    QUOTE '"' 
    IGNOREHEADER 1 
    REGION 'ap-south-1';
		

EXCEPTION WHEN OTHERS THEN
    -- Raise an error message with details
    RAISE INFO '==========================================';
    RAISE INFO 'ERROR OCCURED DURING LOADING BRONZE LAYER';
    RAISE INFO '==========================================';
END;
$$;

CALL bronze.load_bronze();
