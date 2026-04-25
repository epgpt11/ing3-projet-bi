
USE ods_staging;
 
-- ----- continent.txt -----
DROP TABLE IF EXISTS stg_continent;
CREATE TABLE stg_continent (
    Continent_ID    VARCHAR(10),
    Continent_Name  VARCHAR(100)
);
 
-- ----- country.csv -----
DROP TABLE IF EXISTS stg_country;
CREATE TABLE stg_country (
    Country             VARCHAR(10),
    Country_Name        VARCHAR(100),
    Population          VARCHAR(20),
    Country_ID          VARCHAR(10),
    Continent_ID        VARCHAR(10),
    Country_FormerName  VARCHAR(100)
);
 
-- ----- state.xlsx -----
DROP TABLE IF EXISTS stg_state;
CREATE TABLE stg_state (
    State_ID    VARCHAR(20),
    State_Type  VARCHAR(50),
    State_Code  VARCHAR(20),
    State_Name  VARCHAR(100),
    Country     VARCHAR(10)
);
 
-- ----- county.txt (delimiter: ;) -----
DROP TABLE IF EXISTS stg_county;
CREATE TABLE stg_county (
    County_ID       VARCHAR(20),
    County_Type     VARCHAR(50),
    County_Name     VARCHAR(200),
    Province_Type   VARCHAR(50),
    Province_Name   VARCHAR(200),
    Region_Name     VARCHAR(200),
    Region_Type     VARCHAR(50),
    State_ID        VARCHAR(20),
    Country         VARCHAR(10)
);
 
-- ----- city.xml -----
DROP TABLE IF EXISTS stg_city;
CREATE TABLE stg_city (
    City_ID     VARCHAR(20),
    City_Name   VARCHAR(200),
    Country     VARCHAR(10)
);
 
-- ----- postal_code.txt  -----
DROP TABLE IF EXISTS stg_postal_code;
CREATE TABLE stg_postal_code (
    Postal_Code_ID  VARCHAR(20),
    Postal_Code     VARCHAR(20),
    City_Name       VARCHAR(200),
    City_ID         VARCHAR(20)
);
 
-- ----- street_code.txt -----
DROP TABLE IF EXISTS stg_street_code;
CREATE TABLE stg_street_code (
    Street_ID       VARCHAR(20),
    Country         VARCHAR(10),
    Street_Name     VARCHAR(300),
    City_ID         VARCHAR(20),
    Postal_Code     VARCHAR(20),
    From_Street_Num VARCHAR(20),
    To_Street_Num   VARCHAR(20),
    City_Name       VARCHAR(200),
    Count           VARCHAR(20),
    County_ID       VARCHAR(20),
    Postal_Code_ID  VARCHAR(20)
);
 
-- ----- geo_type.txt  -----
DROP TABLE IF EXISTS stg_geo_type;
CREATE TABLE stg_geo_type (
    Geo_Type_ID     VARCHAR(10),
    Geo_Type_Name   VARCHAR(100),
    Country         VARCHAR(10)
);
 
-- ----- org_level.txt  -----
DROP TABLE IF EXISTS stg_org_level;
CREATE TABLE stg_org_level (
    Org_Level       VARCHAR(10),
    Org_Level_Name  VARCHAR(100)
);
 
-- ----- organization.txt  -----
DROP TABLE IF EXISTS stg_organization;
CREATE TABLE stg_organization (
    Employee_ID     VARCHAR(20),
    Org_Name        VARCHAR(200),
    Country         VARCHAR(10),
    Org_Level       VARCHAR(10),
    Start_Date      VARCHAR(50),
    End_Date        VARCHAR(50),
    Org_Ref_ID      VARCHAR(20)
);
 
-- ----- staff.xls -----
DROP TABLE IF EXISTS stg_staff;
CREATE TABLE stg_staff (
    Employee_ID     VARCHAR(20),
    Start_Date      VARCHAR(50),
    End_Date        VARCHAR(50),
    Job_Title       VARCHAR(200),
    Salary          VARCHAR(50),
    Gender          VARCHAR(10),
    Birth_Date      VARCHAR(50),
    Emp_Hire_Date   VARCHAR(50),
    Emp_Term_Date   VARCHAR(50),
    Manager_ID      VARCHAR(20)
);
 
-- ----- product_level.txt -----
DROP TABLE IF EXISTS stg_product_level;
CREATE TABLE stg_product_level (
    Product_Level       VARCHAR(10),
    Product_Level_Name  VARCHAR(100)
);
 
-- ----- product_list.txt -----
DROP TABLE IF EXISTS stg_product_list;
CREATE TABLE stg_product_list (
    Product_ID      VARCHAR(20),
    Product_Name    VARCHAR(200),
    Supplier_ID     VARCHAR(20),
    Product_Level   VARCHAR(10),
    Product_Ref_ID  VARCHAR(20)
);
 
-- ----- price_list.txt  -----
DROP TABLE IF EXISTS stg_price_list;
CREATE TABLE stg_price_list (
    Product_ID       VARCHAR(20),
    Start_Date       VARCHAR(50),
    End_Date         VARCHAR(50),
    Unit_Cost_Price  VARCHAR(50),
    Unit_Sales_Price VARCHAR(50),
    Factor           VARCHAR(50)
);
 
-- ----- discount.csv  -----
DROP TABLE IF EXISTS stg_discount;
CREATE TABLE stg_discount (
    Product_ID       VARCHAR(20),
    Start_Date       VARCHAR(50),
    End_Date         VARCHAR(50),
    Unit_Sales_Price VARCHAR(50),
    Discount         VARCHAR(50)
);
 
-- ----- supplier.xlsx -----
DROP TABLE IF EXISTS stg_supplier;
CREATE TABLE stg_supplier (
    Supplier_ID       VARCHAR(20),
    Supplier_Name     VARCHAR(200),
    Street_ID         VARCHAR(20),
    Supplier_Address  VARCHAR(300),
    Sup_Street_Number VARCHAR(20),
    Country           VARCHAR(10)
);
 
-- ----- customer_type.txt -----
DROP TABLE IF EXISTS stg_customer_type;
CREATE TABLE stg_customer_type (
    Customer_Type_ID    VARCHAR(10),
    Customer_Type       VARCHAR(100),
    Customer_Group_ID   VARCHAR(10),
    Customer_Group      VARCHAR(100)
);
 
-- ----- customer.data  -----
DROP TABLE IF EXISTS stg_customer;
CREATE TABLE stg_customer (
    Customer_ID         VARCHAR(20),
    Country             VARCHAR(10),
    Gender              VARCHAR(10),
    Personal_ID         VARCHAR(50),
    Customer_Name       VARCHAR(200),
    Customer_FirstName  VARCHAR(100),
    Customer_LastName   VARCHAR(100),
    Birth_Date          VARCHAR(50),
    Customer_Address    VARCHAR(300),
    Street_ID           VARCHAR(20),
    Street_Number       VARCHAR(20),
    Customer_Type_ID    VARCHAR(10)
);
 
-- ----- orders.xls -----
DROP TABLE IF EXISTS stg_orders;
CREATE TABLE stg_orders (
    Order_ID        VARCHAR(20),
    Order_Type      VARCHAR(50),
    Employee_ID     VARCHAR(20),
    Customer_ID     VARCHAR(20),
    Order_Date      VARCHAR(50),
    Delivery_Date   VARCHAR(50)
);
 
-- ----- order_item.txt -----
DROP TABLE IF EXISTS stg_order_item;
CREATE TABLE stg_order_item (
    Order_ID            VARCHAR(20),
    Order_Item_Num      VARCHAR(10),
    Product_ID          VARCHAR(20),
    Quantity            VARCHAR(20),
    Total_Retail_Price  VARCHAR(50),
    CostPrice_Per_Unit  VARCHAR(50),
    Discount            VARCHAR(50)
);


-- confirmation des tables
SHOW TABLES;