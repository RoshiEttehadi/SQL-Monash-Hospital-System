/* ITO4132 MO 2022 TP3 Assignment 2 Task 2 ANSWERS
   Student Name: Roshanak Ettehadi
   Student ID: 33190984

   Comments to your marker:
   
*/

/* (i)List the doctor title, first name, last name and contact phone number for all doctors who specialise in the area of "ORTHOPEDIC SURGERY" (this is the specialisation description). Order the list by the doctors' last name and within this, if two doctors have the same last name, order them by their respective first names.*/

SELECT
    d.doctor_title,
    d.doctor_fname,
    d.doctor_lname,
    d.doctor_phone
FROM
         doctor d
    JOIN doctor_speciality ds
    ON d.doctor_id = ds.doctor_id
    JOIN speciality        s
    ON ds.spec_code = s.spec_code
WHERE
    upper(s.spec_description) = 'ORTHOPEDIC SURGERY'
ORDER BY
    d.doctor_lname,
    d.doctor_fname;

/* (ii)List the item code, item description, item stock and the cost centre title which provides these items for all items which have a stock greater than 50 items and include the word 'disposable' in their item description. Order the output by the item code.*/

SELECT
    i.item_code,
    i.item_description,
    i.item_stock,
    c.cc_title
FROM
         item i
    JOIN costcentre c
    ON i.cc_code = c.cc_code
WHERE
        i.item_stock > 50
    AND upper(i.item_description) LIKE '%DISPOSABLE%'
ORDER BY
    i.item_code;
    
/* (iii)List the patient id, patient's full name as a single column, admission date and time and the supervising doctor's full name (including title) as a single column for all those patients admitted on the 1st June 2022. Your output must include at least two admissions on this date which occurred at different times. Order the output by the admission time with the earliest admission first, where several admissions occur at the same time order them by the patient id. Your output must have the form shown in the following image including using the indicated column headings:*/
SELECT
    a.patient_id                                       AS patient_id,
    p.patient_fname
    || ' '
    || p.patient_lname                                 AS patient_name,
    to_char(a.adm_date_time, 'DD-Mon-YYYY HH24:MI:SS') AS admission_datetime,
    d.doctor_title
    || ' '
    || d.doctor_fname
    || ' '
    || d.doctor_lname                                  AS doctor_name
FROM
         admission a
    JOIN patient p
    ON a.patient_id = p.patient_id
    JOIN doctor  d
    ON a.doctor_id = d.doctor_id
WHERE
    trunc(a.adm_date_time) = TO_DATE('01-Jun-2022', 'DD-Mon-YYYY')
ORDER BY
    a.adm_date_time,
    a.patient_id;


/* (iv)List the procedure code, name, description, and standard cost where the procedure standard cost is less expensive than the average procedure standard cost. The output must show the most expensive procedure first, where two procedures have the same standard cost order them by the procedure code. The procedure standard cost must be displayed with two decimal points and a leading $ symbol, for example as $120.66 and be right-aligned.*/

SELECT
    proc_code,
    proc_name,
    proc_description,
    to_char(proc_std_cost, '$9999999.00') AS proc_std_cost
FROM
    procedure
WHERE
    proc_std_cost < (
        SELECT
            AVG(proc_std_cost)
        FROM
            procedure
    )
ORDER BY
    proc_std_cost DESC,
    proc_code ASC;

 
/* (v)List the patient's id, last name, first name, date of birth and the number of times the patient has been admitted to the hospital where the number of admissions is greater than 2. The output should show patients with the most number of admissions first and for patients with the same number of admissions, show the patients in their date of birth order. Your output must include at least two patients with the same number of admissions.*/

SELECT
    p.patient_id,
    p.patient_lname,
    p.patient_fname,
    p.patient_dob,
    COUNT(a.adm_no) AS num_admissions
FROM
         patient p
    JOIN admission a
    ON p.patient_id = a.patient_id
GROUP BY
    p.patient_id,
    p.patient_lname,
    p.patient_fname,
    p.patient_dob
HAVING
    COUNT(a.adm_no) > 2
ORDER BY
    num_admissions DESC,
    p.patient_dob ASC;


    
/* (vi)List the admission number, patient id, first name, last name and the length of their stay in the hospital for all patients who have been discharged and who were in the hospital longer than the average stay for all discharged patients. The length of stay must be shown in the form 10 days 2.0 hrs where hours are rounded to one decimal digit, with the output right aligned. The output must be displayed in admission number order. Your output must have the form is shown in the following image (only some rows shown), including using the indicated column headings*/

SELECT
    a.adm_no        AS adm_no,
    a.patient_id    AS patient_id,
    p.patient_fname AS patient_fname,
    p.patient_lname AS patient_lname,
    rpad(trunc(a.adm_discharge - a.adm_date_time),
         2)
    || ' days'
    || to_char(mod(a.adm_discharge - a.adm_date_time, 1),
               '0.0')
    || ' hrs'       AS stay_length
FROM
         admission a
    JOIN patient p
    ON a.patient_id = p.patient_id
WHERE
    a.adm_discharge IS NOT NULL
    AND a.adm_discharge - a.adm_date_time > (
        SELECT
            AVG(adm_discharge - adm_date_time)
        FROM
            admission
        WHERE
            adm_discharge IS NOT NULL
    )
ORDER BY
    a.adm_no;


    
/* (vii)Given a doctor may charge more or less than the standard charge for a procedure carried out during an admission procedure, the hospital administration is interested in finding out what variations on the standard price have been charged. The hospital terms the difference between the procedure standard cost and the average actual charged procedure cost which has been charged to patients for all such procedures which have been carried out as the procedure "
For all procedures which have been carried out on an admission determine the procedure price differential. The list should show the procedure code, name, description, standard time and the procedure price differential in procedure code order. Your output must have the form shown in the following image including using the indicated column headings:*/

SELECT
    p.proc_code        AS proc_code,
    p.proc_name        AS proc_name,
    p.proc_description AS proc_description,
    p.proc_time        AS proc_time,
    AVG(ap.adprc_pat_cost) - p.proc_std_cost,
    2                  AS pric_differential
FROM
         adm_prc ap
    JOIN procedure p
    ON ap.proc_code = p.proc_code
GROUP BY
    p.proc_code,
    p.proc_name,
    p.proc_description,
    p.proc_time
ORDER BY
p.proc_code;

/* (viii)List for every procedure, the items which have been used and the maximum number of those items used when the procedure was carried on an admission. Your list must show the procedure code, procedure name, item code and item description and the maximum quantity of this item used for the given procedure.
If the procedure has not been carried out on any admission or has not used any items then the item code, item description and maximum quantity columns must show "---". The output must be in procedure name order and for a given procedure name in item code order. Your output must have the form shown in the following image (only some rows show) including using the indicated column headings.*/

SELECT
    p.proc_code         AS proc_code,
    p.proc_name         AS proc_name,
    NVL(i.item_code, '---')         AS item_code,
    NVL(i.item_description, '---')  AS item_description,
    MAX(it.it_qty_used) AS max_qty_used
FROM
         procedure p
    LEFT JOIN adm_prc        ap
    ON p.proc_code = ap.proc_code
    LEFT JOIN item_treatment it
    ON ap.adprc_no = it.adprc_no
    LEFT JOIN item           i
    ON it.item_code = i.item_code
GROUP BY
    p.proc_code,
    p.proc_name,
    i.item_code,
    i.item_description
ORDER BY
    p.proc_name,
    i.item_code;

COMMIT;