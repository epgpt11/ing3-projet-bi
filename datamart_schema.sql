/* Code Datamarts pour les KPI*/

-- =========================================================
-- KPI 1 : Produits qui se vendent le mieux
-- =========================================================

DROP TABLE IF EXISTS dm_top_produits;
/*
CREATE TABLE dm_top_produits AS
SELECT 
    p.id_produit,
    p.nom_produit,

    SUM(f.quantite) AS total_quantite,
    SUM(f.montant_vente) AS chiffre_affaire

FROM faits_sales f
JOIN dim_product p ON f.id_produit = p.id_produit

GROUP BY p.id_produit;
*/

DROP TABLE IF EXISTS dm_top_produits;
CREATE TABLE dm_top_produits AS
SELECT p.id_produit, p.nom_produit, p.ligne_produit,
    SUM(CAST(f.quantite AS DECIMAL(14,2))) AS total_quantite,
    SUM(CAST(f.montant_vente AS DECIMAL(14,2))) AS chiffre_affaire
    
FROM datawarehouse.fait_ventes f
JOIN datawarehouse.dim_product p ON f.id_produit = p.id_produit
GROUP BY p.id_produit, p.nom_produit, p.ligne_produit;


-- =========================================================
-- KPI 2 : Produits en perte de vitesse
-- =========================================================

/*
DROP TABLE IF EXISTS dm_tendances;

CREATE TABLE dm_tendances AS
SELECT 
    p.id_produit,
    p.nom_produit,
    t.annee,
    t.mois,

    SUM(f.quantite) AS quantite_mensuelle,
    SUM(f.montant_vente) AS ca_mensuel

FROM faits_sales f
JOIN dim_product p ON f.id_produit = p.id_produit
JOIN dim_temps t ON f.id_temps = t.id_temps

GROUP BY 
    p.id_produit,
    t.annee,
    t.mois;
*/

USE datamarts;

DROP TABLE IF EXISTS dm_tendances;
CREATE TABLE dm_tendances AS
SELECT 
    p.id_produit,
    p.nom_produit,
    t.annee,
    t.mois,
    SUM(f.quantite) AS quantite_mensuelle,
    SUM(f.montant_vente) AS ca_mensuel
FROM datawarehouse.fait_ventes f
JOIN datawarehouse.dim_product p ON f.id_produit = p.id_produit
JOIN datawarehouse.dim_temps t ON f.id_temps = t.id_temps
WHERE f.id_temps IS NOT NULL
GROUP BY p.id_produit, p.nom_produit, t.annee, t.mois;

SELECT COUNT(*) FROM dm_tendances;


-- =========================================================
-- KPI 3 : Produits contribuant peu au CA pour un pays et une année donnés
-- =========================================================

DROP TABLE IF EXISTS dm_ca_faible;
/*
CREATE TABLE dm_ca_faible AS
SELECT 
    p.id_produit,
    p.nom_produit,
    t.annee,
    g.pays,

    SUM(f.montant_vente) AS chiffre_affaire

FROM faits_sales f
JOIN dim_product p ON f.id_produit = p.id_produit
JOIN dim_temps t ON f.id_temps = t.id_temps
JOIN dim_geographie g ON f.id_geo_client = g.id_geo

GROUP BY 
    p.id_produit,
    t.annee,
    g.pays;
*/


DROP TABLE IF EXISTS dm_ca_faible;
CREATE TABLE dm_ca_faible AS
SELECT p.id_produit, p.nom_produit, p.ligne_produit, t.annee,
    g.pays,
    SUM(CAST(f.montant_vente AS DECIMAL(14,2))) AS chiffre_affaire
FROM datawarehouse.fait_ventes f
JOIN datawarehouse.dim_product p ON f.id_produit = p.id_produit
JOIN datawarehouse.dim_temps t ON CAST(f.id_temps AS UNSIGNED) = t.id_temps
JOIN datawarehouse.dim_geographie g ON CAST(f.id_geo AS UNSIGNED) = g.id_geo
WHERE f.id_geo != 'null' AND f.id_geo IS NOT NULL
GROUP BY p.id_produit, p.nom_produit, p.ligne_produit, t.annee, g.pays;    


-- =========================================================
-- KPI 4 : Dépendance marge vs quantité
-- =========================================================
/*
DROP TABLE IF EXISTS dm_marge;

CREATE TABLE dm_marge AS
SELECT 
    p.id_produit,
    p.nom_produit,

    SUM(f.quantite) AS total_quantite,
    AVG(f.marge) AS marge_moyenne,
    SUM(f.marge) AS marge_totale

FROM faits_sales f
JOIN dim_product p ON f.id_produit = p.id_produit

GROUP BY p.id_produit;

*/
-- KPI 4: Marge vs quantité
DROP TABLE IF EXISTS dm_marge;
CREATE TABLE dm_marge AS
SELECT p.id_produit, p.nom_produit, p.ligne_produit,
    SUM(CAST(f.quantite AS DECIMAL(14,2))) AS total_quantite,
    SUM(f.marge) AS marge_totale,
    ROUND(SUM(f.marge) / NULLIF(SUM(CAST(f.quantite AS DECIMAL(14,2))), 0), 2) AS marge_par_unite
FROM datawarehouse.fait_ventes f
JOIN datawarehouse.dim_product p ON f.id_produit = p.id_produit
GROUP BY p.id_produit, p.nom_produit, p.ligne_produit;
