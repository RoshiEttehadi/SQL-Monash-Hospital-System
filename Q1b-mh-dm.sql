/* ITO4132 MO 2022 TP3 Assignment 2 Task 1 Part B ANSWERS
   Student Name: Roshanak Ettehadi
   Student ID: 33190984

   Comments to your marker:
   
--(i) Create a set of sequences that will allow you to enter data into the PATIENT, ADMISSION and ADM_PRC tables - all such sequences must start at 200000 and go up in steps of 10 (ie. the first value is 200000, the next 200010 etc)*/

DROP SEQUENCE patient_seq;

CREATE SEQUENCE patient_seq START WITH 200000 INCREMENT BY 10;

DROP SEQUENCE admission_seq;

CREATE SEQUENCE admission_seq START WITH 200000 INCREMENT BY 10;

DROP SEQUENCE adm_prc_seq;

CREATE SEQUENCE adm_prc_seq START WITH 200000 INCREMENT BY 10;

/* (ii) Peter Xiue who lives at "14 Narrow Lane Caulfield" was admitted on the 1st June 2022 at 1 PM as a new patient. He was born on the 1st October 1981 and has a contact phone number of 0123456789. His supervising doctor will be Dr Sawyer HAISELL (you may assume that this doctor's name is unique). Peter has not been discharged as yet. Add Peter to the Monash Hospital system*/

INSERT INTO patient VALUES (
    patient_seq.NEXTVAL,
    'Peter',
    'Xiue',
    '14 Narrow Lane Caulfield',
    TO_DATE('1-Oct-1981', 'DD-Mon-YYYY'),
    '0123456789'
);

INSERT INTO admission VALUES (
    admission_seq.NEXTVAL,
    TO_DATE('01-Jun-2022 13:00:00', 'DD-Mon-YYYY HH24:MI:SS'),
    NULL,
    200000,
    1033
);

INSERT INTO adm_prc VALUES (
    adm_prc_seq.NEXTVAL,
    TO_DATE('10-Jun-2022 12:03:22', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    200000,
    15509,
    1033,
    1033
);


/* (iii) Dr Decca BLANKHORN has changed her "Thoracic surgery" specialisation to "Vascular surgery" (you may assume that this doctor’s name is unique). In making this change you may not use insert or delete.*/
UPDATE doctor_speciality
SET
    spec_code = 'VASCUL'
WHERE
        doctor_id = (
            SELECT
                doctor_id
            FROM
                doctor
            WHERE
                    upper(doctor_fname) = upper('Decca')
                AND upper(doctor_lname) = upper('Blankhorn')
        )
    AND upper(spec_code) = upper('THORAC');

/* (iv) Following several legal challenges, the hospital has decided that they no longer wish to support the "Medical genetics" specialisation and want it removed from the areas in which a doctor can indicate a specialisation. In arriving at your solution remember you are not permitted to alter the supplied schema in any form, including using an alter statement on the created tables.*/

/*Update where doctor speciality is GENETI*/
UPDATE doctor_speciality
SET
    spec_code = upper('CARDIO')
WHERE
        doctor_id = '1033'
    AND spec_code = upper('GENETI');


/* Remove the "Medical Genetics" from the Speciality table*/

DELETE FROM speciality
WHERE
    spec_code = upper('GENETI');

COMMIT;