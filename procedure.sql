-- Modifier l'adresse mail d'un client

CREATE OR REPLACE PROCEDURE modifier_adresse_mail(p_numero_client INT, p_nouvelle_adresse_mail VARCHAR) AS
$$
BEGIN
    UPDATE client SET adresse_mail = p_nouvelle_adresse_mail WHERE numero_client = p_numero_client;
END;
$$
LANGUAGE plpgsql;

-- Exemple d'exécution
CALL modifier_adresse_mail(1, 'abdou_smaika@email.com');

-- ----------------------------------------------------------------------------------------------------------------
-- Changer le statut d'une prescription
CREATE OR REPLACE PROCEDURE changer_statut_prescription(IN p_numero_prescription INT)
AS $$
BEGIN
    UPDATE prescription SET statut = 'Terminé' WHERE numero_prescription = p_numero_prescription;
END;
$$ 
LANGUAGE plpgsql;

-- Exemple d'exécution
CALL changer_statut_prescription(501);

-- ----------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE ajouter_intervention(IN p_numero_intervention INT, 
                                                 IN p_date_entree DATE, 
                                                 IN p_date_retour DATE, 
                                                 IN p_duree_prevu INT, 
                                                 IN p_devis DECIMAL(10,2), 
                                                 IN p_facture DECIMAL(10,2), 
                                                 IN p_numero_vehicule INT, 
                                                 IN p_numero_garage INT, 
                                                 IN p_id_type INT,
                                                 IN p_numero_prescription INT)
AS $$
BEGIN
    -- Ajouter l'intervention
    INSERT INTO intervention (numero_intervention, date_entree, date_retour, duree_prevu, devis, facture, numero_vehicule, numero_garage, id_type)
    VALUES (p_numero_intervention, p_date_entree, p_date_retour, p_duree_prevu, p_devis, p_facture, p_numero_vehicule, p_numero_garage, p_id_type);

    -- Associer l'intervention à une prescription
    INSERT INTO prescriptions_par_interventions (numero_prescription, numero_intervention)
    VALUES (p_numero_prescription, p_numero_intervention);
END;
$$ LANGUAGE plpgsql;

-- Exécution : 
CALL ajouter_intervention(2000, '2023-09-01', '2023-09-05', 3, 120.00, 150.00, 109, 212, 6, 504);


-- ----------------------------------------------------------------------------------------------------------------------------------------


--Ajouter un nouveau type d'intervention 
CREATE OR REPLACE PROCEDURE ajouter_type_intervention(IN p_id_type INT, IN p_libelle VARCHAR(50))
AS $$
BEGIN
    INSERT INTO types_interventions (id_type, libelle) VALUES (p_id_type, p_libelle);
END;
$$ LANGUAGE plpgsql;

-- Exécution: 
CALL ajouter_type_intervention(10, 'Révision générale');


-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Supprimer le type d'intervention

CREATE OR REPLACE PROCEDURE supprimer_type_intervention(IN p_id_type INT)
AS $$
BEGIN
    
    DELETE FROM types_interventions WHERE id_type = p_id_type;
END;
$$ LANGUAGE plpgsql;


-- Exécution:

CALL supprimer_type_intervention(10);


-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Ajouter une nouvelle prescription pour un véhicule existant
CREATE OR REPLACE PROCEDURE ajouter_prescription(IN p_numero_prescription INT, 
                                                 IN p_description TEXT,
                                                 IN p_duree INT,
                                                 IN p_statut VARCHAR(50),
                                                 IN p_date_realisation DATE,
                                                 IN p_vehicule_numero INT)
AS $$
BEGIN
    INSERT INTO prescription (numero_prescription, description, duree, statut, date_realisation, vehicule_numero)
    VALUES (p_numero_prescription, p_description, p_duree, p_statut, p_date_realisation, p_vehicule_numero);
END;
$$ LANGUAGE plpgsql;

-- Exécution:
CALL ajouter_prescription(504, 'Réparation de la climatisation', 3, 'En attente', NULL, 101);


