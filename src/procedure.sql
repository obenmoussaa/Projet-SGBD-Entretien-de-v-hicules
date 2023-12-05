CREATE OR REPLACE PROCEDURE modifier_adresse_mail(p_numero_client INT, p_nouvelle_adresse_mail VARCHAR) AS
$$
BEGIN
    UPDATE client SET addresse_mail = p_nouvelle_adresse_mail WHERE numero_client = p_numero_client;
END;
$$
LANGUAGE plpgsql;
CALL modifier_adresse_mail(1, 'abdou_smaika@email.com');




