/* Code Datamarts pour les KPI*/

-- =========================================================
-- KPI 1 : Produits qui se vendent le mieux
-- =========================================================

DROP TABLE IF EXISTS dm_top_produits;

CREATE TABLE dm_top_produits AS
SELECT 
    p.id_produit,
    p.nom_produit,

    SUM(f.quantite) AS total_quantite,
    SUM(f.montant_vente) AS chiffre_affaire

FROM faits_sales f
JOIN dim_product p ON f.id_produit = p.id_produit

GROUP BY p.id_produit;


-- =========================================================
-- KPI 2 : Produits en perte de vitesse
-- =========================================================

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


-- =========================================================
-- KPI 3 : Produits contribuant peu au CA pour un pays et une année donnés
-- =========================================================

DROP TABLE IF EXISTS dm_ca_faible;

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


-- =========================================================
-- KPI 4 : Dépendance marge vs quantité
-- =========================================================

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