
USE datawarehouse;

-- Drop dans l'ordre (fait_ventes d'abord car FK)
DROP TABLE IF EXISTS fait_ventes;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_client;
DROP TABLE IF EXISTS dim_geographie;
DROP TABLE IF EXISTS dim_temps;
DROP TABLE IF EXISTS dim_supplier;
DROP TABLE IF EXISTS dim_employee;


-- ==========================================
-- DIMENSIONS
-- ==========================================

-- ----- Dim_product -----
-- Sources: stg_product_list (self-join hiérarchie) + stg_price_list
CREATE TABLE dim_product (
    id_produit          VARCHAR(50) PRIMARY KEY,
    nom_produit         VARCHAR(255),
    groupe_produit      VARCHAR(255),
    categorie_produit   VARCHAR(255),
    ligne_produit       VARCHAR(255),
    prix_courant        VARCHAR(50),
    cout_courant        VARCHAR(50)
);

-- ----- Dim_client -----
-- Sources: stg_customer + stg_customer_type
CREATE TABLE dim_client (
    id_client           VARCHAR(50) PRIMARY KEY,
    nom                 VARCHAR(255),
    type_client         VARCHAR(255),
    groupe_activite     VARCHAR(255)
);

-- ----- Dim_geographie -----
-- Sources: stg_postal_code + stg_city + stg_country + stg_continent
--          + stg_street_code + stg_county + stg_state
CREATE TABLE dim_geographie (
    id_geo              INT AUTO_INCREMENT PRIMARY KEY,
    pays                VARCHAR(255),
    continent           VARCHAR(255),
    region              VARCHAR(255),
    ville               VARCHAR(255),
    code_postal         VARCHAR(50)
);

-- ----- Dim_temps -----
-- Générée par procédure (1998-01-01 → 2002-12-31)
CREATE TABLE dim_temps (
    id_temps            INT PRIMARY KEY,          -- format YYYYMMDD
    date_complete       DATE NOT NULL,
    jour                TINYINT NOT NULL,
    mois                TINYINT NOT NULL,
    trimestre           TINYINT NOT NULL,
    annee               SMALLINT NOT NULL,
    jour_semaine        TINYINT NOT NULL,
    semaine_annee       TINYINT NOT NULL,
    INDEX idx_annee (annee),
    INDEX idx_mois (annee, mois),
    INDEX idx_trimestre (annee, trimestre)
);

-- ----- Dim_supplier -----
-- Sources: stg_supplier + stg_country
CREATE TABLE dim_supplier (
    id_supplier         VARCHAR(50) PRIMARY KEY,
    nom                 VARCHAR(255),
    pays                VARCHAR(255)
);

-- ----- Dim_employee -----
CREATE TABLE dim_employee (
    id_employee         VARCHAR(50) PRIMARY KEY,
    nom                 VARCHAR(255),
    departement         VARCHAR(255),
    section             VARCHAR(255),
    groupe              VARCHAR(255),
    pays                VARCHAR(255),
    date_entree         VARCHAR(50)
);


-- ==========================================
-- TABLE DE FAIT
-- ==========================================

-- Sources: stg_order_item + stg_orders + dim_*
CREATE TABLE fait_ventes (
    id_fait             BIGINT AUTO_INCREMENT PRIMARY KEY,

    -- FK dimensions
    id_produit          VARCHAR(50),
    id_client           VARCHAR(50),
    id_temps            INT,
    id_geo_vente        INT,
    id_geo_client       INT,
    id_employee         VARCHAR(50),
    id_supplier         VARCHAR(50),

    -- Mesures
    quantite            INT,
    prix_unitaire       DECIMAL(14,2),
    cout_unitaire       DECIMAL(14,2),
    montant_vente       DECIMAL(14,2),
    marge               DECIMAL(14,2),
    remise              DECIMAL(5,2),

    -- Index
    INDEX idx_temps (id_temps),
    INDEX idx_produit (id_produit),
    INDEX idx_client (id_client),
    INDEX idx_geo_vente (id_geo_vente),
    INDEX idx_geo_client (id_geo_client),
    INDEX idx_employee (id_employee),
    INDEX idx_supplier (id_supplier),

    FOREIGN KEY (id_produit) REFERENCES dim_product(id_produit),
    FOREIGN KEY (id_client) REFERENCES dim_client(id_client),
    FOREIGN KEY (id_temps) REFERENCES dim_temps(id_temps),
    FOREIGN KEY (id_geo_vente) REFERENCES dim_geographie(id_geo),
    FOREIGN KEY (id_geo_client) REFERENCES dim_geographie(id_geo),
    FOREIGN KEY (id_employee) REFERENCES dim_employee(id_employee),
    FOREIGN KEY (id_supplier) REFERENCES dim_supplier(id_supplier)
);


-- ==========================================
-- GÉNÉRATION DIM_TEMPS (1998-2002) => periode de l'historique dans le sujet 
-- ==========================================

DELIMITER //
DROP PROCEDURE IF EXISTS generate_dim_temps //
CREATE PROCEDURE generate_dim_temps()
BEGIN
    DECLARE v_date DATE DEFAULT '1998-01-01';
    DECLARE v_end  DATE DEFAULT '2002-12-31';

    WHILE v_date <= v_end DO
        INSERT INTO dim_temps (
            id_temps, date_complete, jour, mois, trimestre,
            annee, jour_semaine, semaine_annee
        ) VALUES (
            CAST(DATE_FORMAT(v_date, '%Y%m%d') AS UNSIGNED),
            v_date,
            DAY(v_date),
            MONTH(v_date),
            QUARTER(v_date),
            YEAR(v_date),
            DAYOFWEEK(v_date),
            WEEK(v_date, 3)
        );
        SET v_date = DATE_ADD(v_date, INTERVAL 1 DAY);
    END WHILE;
END //
DELIMITER ;

CALL generate_dim_temps();


-- ==========================================
-- VÉRIFICATION
-- ==========================================

SHOW TABLES;


-- utilise si beseoin 

/*
SELECT 'dim_product'    AS tbl, COUNT(*) AS cnt FROM dim_product
UNION ALL SELECT 'dim_client',     COUNT(*) FROM dim_client
UNION ALL SELECT 'dim_geographie', COUNT(*) FROM dim_geographie
UNION ALL SELECT 'dim_temps',      COUNT(*) FROM dim_temps
UNION ALL SELECT 'dim_supplier',   COUNT(*) FROM dim_supplier
UNION ALL SELECT 'dim_employee',   COUNT(*) FROM dim_employee
UNION ALL SELECT 'fait_ventes',    COUNT(*) FROM fait_ventes;
*/