# Liste des Jobs 
## Source → Staging 

### 🔹 Job : job_stg_continent
**Table entrée :** continent.txt  
**Table sortie :** stg_continent  

| Input | Output |
|------|--------|
| row1.Continent_ID | row1.Continent_ID → Continent_ID |
| row1.Continent_Name | row1.Continent_Name.replace("\"","").trim() → Continent_Name |

---

### 🔹 Job : job_stg_country
**Table entrée :** country.csv  
**Table sortie :** stg_country  

| Input | Output |
|------|--------|
| row1.Country | row1.Country.replace("\"","").trim() → Country |
| row1.Country_Name | row1.Country_Name.replace("\"","").trim() → Country_Name |
| row1.Population | row1.Population.replace(",","") → Population |
| row1.Country_ID | row1.Country_ID.replace(",00","") → Country_ID |
| row1.Continent_ID | row1.Continent_ID.replace(",00","") → Continent_ID |
| row1.Country_FormerName | row1.Country_FormerName → Country_FormerName |

---

### 🔹 Job : job_stg_state
**Table entrée :** state.xlsx  
**Table sortie :** stg_state  

| Input | Output |
|------|--------|
| row1.State_ID | row1.State_ID.replace(",00","") → State_ID |
| row1.State_Type | row1.State_Type → State_Type |
| row1.State_Code | row1.State_Code → State_Code |
| row1.State_Name | row1.State_Name.replace("\"","").trim() → State_Name |
| row1.Country | row1.Country → Country |

---

### 🔹 Job : job_stg_county
**Table entrée :** county.txt  
**Table sortie :** stg_county  

| Input | Output |
|------|--------|
| row1.County_ID | row1.County_ID.replace(",00","") → County_ID |
| row1.County_Type | row1.County_Type → County_Type |
| row1.County_Name | row1.County_Name.replace("\"","").trim() → County_Name |
| row1.Province_Type | row1.Province_Type → Province_Type |
| row1.Province_Name | row1.Province_Name → Province_Name |
| row1.Region_Name | row1.Region_Name → Region_Name |
| row1.Region_Type | row1.Region_Type → Region_Type |
| row1.State_ID | row1.State_ID.replace(",00","") → State_ID |
| row1.Country | row1.Country → Country |

---

### 🔹 Job : job_stg_city
**Table entrée :** city.xml  
**Table sortie :** stg_city  

| Input | Output |
|------|--------|
| row1.City_ID | row1.City_ID.replace(",00","") → City_ID |
| row1.City_Name | row1.City_Name.replace("\"","").trim() → City_Name |
| row1.Country | row1.Country → Country |

---

### 🔹 Job : job_stg_postal_code
**Table entrée :** postal_code.txt  
**Table sortie :** stg_postal_code  

| Input | Output |
|------|--------|
| row1.Postal_Code_ID | row1.Postal_Code_ID.replace(",00","") → Postal_Code_ID |
| row1.Postal_Code | row1.Postal_Code → Postal_Code |
| row1.City_Name | row1.City_Name → City_Name |
| row1.City_ID | row1.City_ID.replace(",00","") → City_ID |

---

### 🔹 Job : job_stg_street_code
**Table entrée :** street_code.txt  
**Table sortie :** stg_street_code  

| Input | Output |
|------|--------|
| row1.Street_ID | row1.Street_ID.replace(",00","") → Street_ID |
| row1.Country | row1.Country → Country |
| row1.Street_Name | row1.Street_Name.replace("\"","").trim() → Street_Name |
| row1.City_ID | row1.City_ID.replace(",00","") → City_ID |
| row1.Postal_Code | row1.Postal_Code → Postal_Code |
| row1.From_Street_Num | row1.From_Street_Num → From_Street_Num |
| row1.To_Street_Num | row1.To_Street_Num → To_Street_Num |
| row1.City_Name | row1.City_Name → City_Name |
| row1.Count | row1.Count → Count |
| row1.County_ID | row1.County_ID.replace(",00","") → County_ID |
| row1.Postal_Code_ID | row1.Postal_Code_ID.replace(",00","") → Postal_Code_ID |

---

### 🔹 Job : job_stg_geo_type
**Table entrée :** geo_type.txt  
**Table sortie :** stg_geo_type  

| Input | Output |
|------|--------|
| row1.Geo_Type_ID | row1.Geo_Type_ID → Geo_Type_ID |
| row1.Geo_Type_Name | row1.Geo_Type_Name → Geo_Type_Name |
| row1.Country | row1.Country → Country |

---

### 🔹 Job : job_stg_org_level
**Table entrée :** org_level.txt  
**Table sortie :** stg_org_level  

| Input | Output |
|------|--------|
| row1.Org_Level | row1.Org_Level → Org_Level |
| row1.Org_Level_Name | row1.Org_Level_Name → Org_Level_Name |

---

### 🔹 Job : job_stg_organization
**Table entrée :** organization.txt  
**Table sortie :** stg_organization  

| Input | Output |
|------|--------|
| row1.Employee_ID | row1.Employee_ID.replace(",00","") → Employee_ID |
| row1.Org_Name | row1.Org_Name.replace("\"","").trim() → Org_Name |
| row1.Country | row1.Country → Country |
| row1.Org_Level | row1.Org_Level → Org_Level |
| row1.Start_Date | row1.Start_Date → Start_Date |
| row1.End_Date | row1.End_Date → End_Date |
| row1.Org_Ref_ID | row1.Org_Ref_ID → Org_Ref_ID |

---

### 🔹 Job : job_stg_staff
**Table entrée :** staff.xls  
**Table sortie :** stg_staff  

| Input | Output |
|------|--------|
| row1.Employee_ID | row1.Employee_ID.replace(",00","") → Employee_ID |
| row1.Start_Date | row1.Start_Date → Start_Date |
| row1.End_Date | row1.End_Date → End_Date |
| row1.Job_Title | row1.Job_Title → Job_Title |
| row1.Salary | row1.Salary.replace(",",".") → Salary |
| row1.Gender | row1.Gender → Gender |
| row1.Birth_Date | row1.Birth_Date → Birth_Date |
| row1.Emp_Hire_Date | row1.Emp_Hire_Date → Emp_Hire_Date |
| row1.Emp_Term_Date | row1.Emp_Term_Date → Emp_Term_Date |
| row1.Manager_ID | row1.Manager_ID.replace(",00","") → Manager_ID |

---

### 🔹 Job : job_stg_product_level
**Table entrée :** product_level.txt  
**Table sortie :** stg_product_level  

| Input | Output |
|------|--------|
| row1.Product_Level | row1.Product_Level → Product_Level |
| row1.Product_Level_Name | row1.Product_Level_Name → Product_Level_Name |

---

### 🔹 Job : job_stg_product_list
**Table entrée :** product_list.txt  
**Table sortie :** stg_product_list  

| Input | Output |
|------|--------|
| row1.Product_ID | row1.Product_ID.replace(",00","") → Product_ID |
| row1.Product_Name | row1.Product_Name.replace("\"","").trim() → Product_Name |
| row1.Supplier_ID | row1.Supplier_ID.replace(",00","") → Supplier_ID |
| row1.Product_Level | row1.Product_Level → Product_Level |
| row1.Product_Ref_ID | row1.Product_Ref_ID → Product_Ref_ID |

---

### 🔹 Job : job_stg_price_list
**Table entrée :** price_list.txt  
**Table sortie :** stg_price_list  

| Input | Output |
|------|--------|
| row1.Product_ID | row1.Product_ID.replace(",00","") → Product_ID |
| row1.Start_Date | row1.Start_Date → Start_Date |
| row1.End_Date | row1.End_Date → End_Date |
| row1.Unit_Cost_Price | row1.Unit_Cost_Price.replace(",",".") → Unit_Cost_Price |
| row1.Unit_Sales_Price | row1.Unit_Sales_Price.replace(",",".") → Unit_Sales_Price |
| row1.Factor | row1.Factor → Factor |

---

### 🔹 Job : job_stg_discount
**Table entrée :** discount.csv  
**Table sortie :** stg_discount  

| Input | Output |
|------|--------|
| row1.Product_ID | row1.Product_ID.replace(",00","") → Product_ID |
| row1.Start_Date | row1.Start_Date → Start_Date |
| row1.End_Date | row1.End_Date → End_Date |
| row1.Unit_Sales_Price | row1.Unit_Sales_Price.replace(",",".") → Unit_Sales_Price |
| row1.Discount | row1.Discount == null ? "0" : row1.Discount → Discount |

---

### 🔹 Job : job_stg_supplier
**Table entrée :** supplier.xlsx  
**Table sortie :** stg_supplier  

| Input | Output |
|------|--------|
| row1.Supplier_ID | row1.Supplier_ID.replace(",00","") → Supplier_ID |
| row1.Supplier_Name | row1.Supplier_Name.replace("\"","").trim() → Supplier_Name |
| row1.Street_ID | row1.Street_ID.replace(",00","") → Street_ID |
| row1.Supplier_Address | row1.Supplier_Address.replace("\"","").trim() → Supplier_Address |
| row1.Sup_Street_Number | row1.Sup_Street_Number → Sup_Street_Number |
| row1.Country | row1.Country → Country |

---

### 🔹 Job : job_stg_customer_type
**Table entrée :** customer_type.txt  
**Table sortie :** stg_customer_type  

| Input | Output |
|------|--------|
| row1.Customer_Type_ID | row1.Customer_Type_ID.replace(",00","") → Customer_Type_ID |
| row1.Customer_Type | row1.Customer_Type.replace("\"","").trim() → Customer_Type |
| row1.Customer_Group_ID | row1.Customer_Group_ID.replace(",00","") → Customer_Group_ID |
| row1.Customer_Group | row1.Customer_Group.replace("\"","").trim() → Customer_Group |

---

### 🔹 Job : job_stg_customer
**Table entrée :** customer.data  
**Table sortie :** stg_customer  

| Input | Output |
|------|--------|
| row1.Customer_ID | row1.Customer_ID.replace(",00","") → Customer_ID |
| row1.Country | row1.Country.replace("\"","").trim() → Country |
| row1.Gender | row1.Gender == null ? "U" : row1.Gender → Gender |
| row1.Personal_ID | row1.Personal_ID == null ? "" : row1.Personal_ID → Personal_ID |
| row1.Customer_Name | row1.Customer_Name.replace("\"","").trim() → Customer_Name |
| row1.Customer_FirstName | row1.Customer_FirstName.replace("\"","").trim() → Customer_FirstName |
| row1.Customer_LastName | row1.Customer_LastName.replace("\"","").trim() → Customer_LastName |
| row1.Birth_Date | row1.Birth_Date → Birth_Date |
| row1.Customer_Address | row1.Customer_Address.replace("\"","").trim() → Customer_Address |
| row1.Street_ID | row1.Street_ID.replace(",00","") → Street_ID |
| row1.Street_Number | row1.Street_Number → Street_Number |
| row1.Customer_Type_ID | row1.Customer_Type_ID.replace(",00","") → Customer_Type_ID |

---

### 🔹 Job : job_stg_orders
**Table entrée :** orders.xls  
**Table sortie :** stg_orders  

| Input | Output |
|------|--------|
| row1.Order_ID | row1.Order_ID.replace(",00","") → Order_ID |
| row1.Order_Type | row1.Order_Type → Order_Type |
| row1.Employee_ID | row1.Employee_ID.replace(",00","") → Employee_ID |
| row1.Customer_ID | row1.Customer_ID.replace(",00","") → Customer_ID |
| row1.Order_Date | row1.Order_Date → Order_Date |
| row1.Delivery_Date | row1.Delivery_Date → Delivery_Date |

---

### 🔹 Job : job_stg_order_item
**Table entrée :** order_item.txt  
**Table sortie :** stg_order_item  

| Input | Output |
|------|--------|
| row1.Order_ID | row1.Order_ID.replace(",00","") → Order_ID |
| row1.Order_Item_Num | row1.Order_Item_Num → Order_Item_Num |
| row1.Product_ID | row1.Product_ID.replace(",00","") → Product_ID |
| row1.Quantity | row1.Quantity.replace(",","") → Quantity |
| row1.Total_Retail_Price | row1.Total_Retail_Price.replace(",","") → Total_Retail_Price |
| row1.CostPrice_Per_Unit | row1.CostPrice_Per_Unit.replace(",","") → CostPrice_Per_Unit |
| row1.Discount | row1.Discount == null ? "0" : row1.Discount → Discount |

---

### 🔹 Job : job_load_staging (Job principal)

**Table entrée :** Sources multiples  
**Table sortie :** Toutes les tables staging  

| Input | Output |
|------|--------|
| tRunJob(job_stg_continent) | stg_continent |
| tRunJob(job_stg_country) | stg_country |
| tRunJob(job_stg_state) | stg_state |
| tRunJob(job_stg_county) | stg_county |
| tRunJob(job_stg_city) | stg_city |
| tRunJob(job_stg_postal_code) | stg_postal_code |
| tRunJob(job_stg_street_code) | stg_street_code |
| tRunJob(job_stg_geo_type) | stg_geo_type |
| tRunJob(job_stg_org_level) | stg_org_level |
| tRunJob(job_stg_organization) | stg_organization |
| tRunJob(job_stg_staff) | stg_staff |
| tRunJob(job_stg_product_level) | stg_product_level |
| tRunJob(job_stg_product_list) | stg_product_list |
| tRunJob(job_stg_price_list) | stg_price_list |
| tRunJob(job_stg_discount) | stg_discount |
| tRunJob(job_stg_supplier) | stg_supplier |
| tRunJob(job_stg_customer) | stg_customer |
| tRunJob(job_stg_orders) | stg_orders |
| tRunJob(job_stg_order_item) | stg_order_item |

---

## Staging → DataWarehouse 