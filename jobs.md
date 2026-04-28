# Liste des Jobs 
## Source → Staging 

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
| row1.Country | row1.Country.replace("\"","").trim() → Country |

---

## 🔹 Job : job_load_staging (Job principal d'orchestration)
**Table entrée :** Sources multiples  
**Table sortie :** Tables staging (toutes)  

| Input | Output |
|------|--------|
| tRunJob(job_stg_continent) | Chargement stg_continent |
| tRunJob(job_stg_country) | Chargement stg_country |
| tRunJob(job_stg_state) | Chargement stg_state |
| tRunJob(job_stg_county) | Chargement stg_county |
| tRunJob(job_stg_city) | Chargement stg_city |
| tRunJob(job_stg_postal_code) | Chargement stg_postal_code |
| tRunJob(job_stg_street_code) | Chargement stg_street_code |
| tRunJob(job_stg_geo_type) | Chargement stg_geo_type |
| tRunJob(job_stg_org_level) | Chargement stg_org_level |
| tRunJob(job_stg_organization) | Chargement stg_organization |
| tRunJob(job_stg_staff) | Chargement stg_staff |
| tRunJob(job_stg_product_level) | Chargement stg_product_level |
| tRunJob(job_stg_product_list) | Chargement stg_product_list |
| tRunJob(job_stg_price_list) | Chargement stg_price_list |
| tRunJob(job_stg_discount) | Chargement stg_discount |
| tRunJob(job_stg_supplier) | Chargement stg_supplier |
| tRunJob(job_stg_customer) | Chargement stg_customer |
| tRunJob(job_stg_orders) | Chargement stg_orders |
| tRunJob(job_stg_order_item) | Chargement stg_order_item |

---

## Staging → DataWarehouse 