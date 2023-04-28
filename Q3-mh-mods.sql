/* ITO4132 MO 2022 TP3 Assignment 2 Task 3 ANSWERS
   Student Name: Roshanak Ettehadi
   Student ID: 33190984

   Comments to your marker:
   
*/
/* (i)The hospital administration would like to keep track of the number of patients that its doctors supervise (ie, the admissions they supervise). They have indicated that they believe, over the life of the MH system, that this number would not be higher than 9,999 for any individual doctor.*/

ALTER TABLE doctor ADD supervision_count NUMBER(4) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN doctor.supervision_count IS
    'Number of patients that its doctors supervisen';

UPDATE doctor d
SET
    d.supervision_count = (
        SELECT
            COUNT(DISTINCT adm_no)
        FROM
            admission
        WHERE
            doctor_id = d.doctor_id
    );

SELECT
    *
FROM
    doctor;
    
/* (i). Add to the admissions information, for each admission, the daily bed charge ($'s/day) which the stay will be charged at - this rate must be inserted when a new admission is added. The current daily bed rate, for all admissions, is $321, this should be set as the default charge when a new admission is added. All existing admissions should have this set as their daily bed charge.*/
ALTER TABLE admission ADD daily_bed_charge NUMBER(5, 0) DEFAULT 321 NOT NULL;

UPDATE admission
SET
    daily_bed_charge = 321;


/* (ii) For all completed admissions, record the invoice details for the amounts which are to be charged for the admission. The invoice details will be added after a discharge date and time has been entered for an admission, only one invoice will be raised per admission. */

/* created the invoice table and insert data*/

DROP TABLE invoice CASCADE CONSTRAINTS;

CREATE TABLE invoice (
    invoice_no      NUMBER(6) NOT NULL,
    adm_no          NUMBER(6) NOT NULL,
    total_proc_cost NUMBER(7, 2) NOT NULL,
    total_bed_cost  NUMBER(7, 2) NOT NULL,
    amount_paid     CHAR(1) NOT NULL
);

COMMENT ON COLUMN invoice.invoice_no IS
    'Invoice identifier assigned automatically (PK)';

COMMENT ON COLUMN invoice.total_proc_cost IS
    'Sum of the costs of all the procedures regarding admission, recorded in adm_prc table'
    ;

COMMENT ON COLUMN invoice.total_bed_cost IS
    'Total cost of hospital bed (multiplying the daily bed charge by number of stay)'
    ;

COMMENT ON COLUMN invoice.amount_paid IS
    'If amount paid or not';

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( invoice_no );

ALTER TABLE invoice
    ADD CONSTRAINT admission_invoice FOREIGN KEY ( adm_no )
        REFERENCES admission ( adm_no );

DROP SEQUENCE invoice_seq;

CREATE SEQUENCE invoice_seq START WITH 100 INCREMENT BY 1;

INSERT INTO invoice (
    invoice_no,
    adm_no,
    total_proc_cost,
    total_bed_cost,
    amount_paid
)
    SELECT
        invoice_seq.NEXTVAL,
        a.adm_no,
        SUM(p.adprc_pat_cost + p.adprc_items_cost),
        ( a.adm_discharge - a.adm_date_time ) * a.daily_bed_charge,
        CASE
            WHEN amount_paid = a.amount_paid THEN
                'Y'
            ELSE
                'N'
        END
    FROM
        admission a
        LEFT JOIN adm_prc   p
    WHERE
        a.adm_discharge IS NOT NULL;

ALTER TABLE admission ADD amount_paid VARCHAR(1);

UPDATE admission a
SET
    amount_paid = (SELECT SUM(SUM(p.adprc_pat_cost + p.adprc_items_cost)) + (TOTAL(SUM(a.adm_discharge - a.adm_date_time) * a.daily_bed_charge) )
                FROM
                    adm_prc p
                    INNER JOIN admission a ON p.adm_no = a.adm_no)
WHERE
    a.adm_discharge IS NOT NULL;

SELECT
    *
FROM
    admission;

SELECT
    *
FROM
    invoice;

COMMIT;