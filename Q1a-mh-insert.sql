/* ITO4132 MO 2022 TP3 Assignment 2 Task 1 Part A ANSWERS
   Student Name: Roshanak Ettehadi
   Student ID: 33190984

   Comments to your marker:
   Adding data to the Patient, Admission, Admission Procedure and item_treatments 
  
*/

/*Adding 10 patients to the Patient table */
INSERT INTO patient (
    patient_id,
    patient_fname,
    patient_lname,
    patient_address,
    patient_dob,
    patient_contact_phn
) VALUES (
    134100,
    'Ali',
    'Mahaseni',
    '8 Main road, WA',
    TO_DATE('14-Mar-1984', 'DD-Mon-YYYY '),
    '0449107123'
);

INSERT INTO patient VALUES (
    134101,
    'Roshi',
    'Ettehadi',
    '8 strett, WA',
    TO_DATE('02-Mar-1970', 'DD-Mon-YYYY '),
    '0449107345'
);

INSERT INTO patient VALUES (
    134102,
    'Nazi',
    'Markus',
    '20 strett, NSW',
    TO_DATE('02-Dec-1960', 'DD-Mon-YYYY '),
    '0449546345'
);

INSERT INTO patient VALUES (
    134103,
    'Nafis',
    'Heidari',
    '9 Terrace, VIC',
    TO_DATE('12-Apr-1933', 'DD-Mon-YYYY '),
    '0449103712'
);

INSERT INTO patient VALUES (
    134104,
    'Avid',
    'Ahmadi',
    '1Court, WA',
    TO_DATE('01-Mar-1980', 'DD-Mon-YYYY '),
    '044910545'
);

INSERT INTO patient VALUES (
    134105,
    'Afshin',
    'Shapori',
    '1 strett, NSW',
    TO_DATE('25-Feb-1973', 'DD-Mon-YYYY '),
    '0449102456'
);

INSERT INTO patient VALUES (
    134106,
    'Sara',
    'Eshraghi',
    '6 strett, WA',
    TO_DATE('13-Oct-1983', 'DD-Mon-YYYY '),
    '0449108745'
);

INSERT INTO patient VALUES (
    134107,
    'Zara',
    'Vatandost',
    '87 Court, WA',
    TO_DATE('03-Mar-1959', 'DD-Mon-YYYY '),
    '0449109872'
);

INSERT INTO patient VALUES (
    134108,
    'Peter',
    'Zaber',
    '125 Road, VIC',
    TO_DATE('12-Mar-1988', 'DD-Mon-YYYY '),
    '0449109384'
);

INSERT INTO patient VALUES (
    134109,
    'Andy',
    'Mackanzi',
    '8 strett, WA',
    TO_DATE('05-Jan-1970', 'DD-Mon-YYYY '),
    '0449107376'
);

/*Adding 15 admissions to the Admission table.
Dates for admissions should be chosen in the period between the 1st January 2022 and the 17th June 2022*/
INSERT INTO admission (
    adm_no,
    adm_date_time,
    adm_discharge,
    patient_id,
    doctor_id
) VALUES (
    238200,
    TO_DATE('01-Jun-2022 12:04:45', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('14-Jun-2022 9:12:37', 'DD-Mon-YYYY HH24:MI:SS'),
    134109,
    1005
);

INSERT INTO admission VALUES (
    238201,
    TO_DATE('2-Feb-2022 8:06:12', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('14-Mar-2022 22:05:22', 'DD-Mon-YYYY HH24:MI:SS'),
    134101,
    1298
);

INSERT INTO admission VALUES (
    238202,
    TO_DATE('11-May-2022 16:10:11', 'DD-Mon-YYYY HH24:MI:SS'),
    NULL,
    134103,
    1099
);

INSERT INTO admission VALUES (
    238203,
    TO_DATE('8-Apr-2022 11:09:30', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('14-Apr-2022 10:12:07', 'DD-Mon-YYYY HH24:MI:SS'),
    134105,
    1064
);

INSERT INTO admission VALUES (
    238204,
    TO_DATE('2-Feb-2022 19:09:32', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('15-Feb-2022 22:44:34', 'DD-Mon-YYYY HH24:MI:SS'),
    134104,
    1061
);

INSERT INTO admission VALUES (
    238205,
    TO_DATE('5-Mar-2022 17:34:38', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('19-Mar-2022 22:22:27', 'DD-Mon-YYYY HH24:MI:SS'),
    134108,
    1005
);

INSERT INTO admission VALUES (
    238206,
    TO_DATE('2-Mar-2022 14:14:54', 'DD-Mon-YYYY HH24:MI:SS'),
    NULL,
    134102,
    1060
);

INSERT INTO admission VALUES (
    238207,
    TO_DATE('9-Feb-2022 12:12:30', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('19-Feb-2022 09:06:07', 'DD-Mon-YYYY HH24:MI:SS'),
    134107,
    1095
);

INSERT INTO admission VALUES (
    238208,
    TO_DATE('20-May-2022 14:23:12', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('25-May-2022 15:15:22', 'DD-Mon-YYYY HH24:MI:SS'),
    134103,
    7890
);

INSERT INTO admission VALUES (
    238209,
    TO_DATE('12-Jan-2022 10:10:12', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('19-Feb-2022 09:12:15', 'DD-Mon-YYYY HH24:MI:SS'),
    134101,
    7900
);

INSERT INTO admission VALUES (
    238210,
    TO_DATE('12-May-2022 15:09:20', 'DD-Mon-YYYY HH24:MI:SS'),
    NULL,
    134102,
    1069
);

INSERT INTO admission VALUES (
    238211,
    TO_DATE('11-Apr-2022 18:04:37', 'DD-Mon-YYYY HH24:MI:SS'),
    NULL,
    134107,
    1056
);

INSERT INTO admission VALUES (
    238212,
    TO_DATE('15-Jan-2022 17:12:22', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('16-Jun-2022 19:11:22', 'DD-Mon-YYYY HH24:MI:SS'),
    134106,
    1033
);

INSERT INTO admission VALUES (
    238213,
    TO_DATE('10-Apr-2022 13:14:45', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('11-Jun-2022 16:17:22', 'DD-Mon-YYYY HH24:MI:SS'),
    134104,
    1018
);

INSERT INTO admission VALUES (
    238214,
    TO_DATE('15-Feb-2022 19:29:22', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('15-Jun-2022 12:03:22', 'DD-Mon-YYYY HH24:MI:SS'),
    134105,
    1028
);

INSERT INTO admission VALUES (
    238215,
    TO_DATE('05-Mar-2022 12:05:16', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('22-Apr-2022 17:22:33', 'DD-Mon-YYYY HH24:MI:SS'),
    134104,
    1028
);

INSERT INTO admission VALUES (
    238216,
    TO_DATE('15-Feb-2022 11:11:34', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('23-Jun-2022 9:34:44', 'DD-Mon-YYYY HH24:MI:SS'),
    134105,
    1033
);

INSERT INTO admission VALUES (
    238217,
    TO_DATE('12-Feb-2022 12:05:16', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('15-Apr-2022 17:22:33', 'DD-Mon-YYYY HH24:MI:SS'),
    134104,
    1056
);

INSERT INTO admission VALUES (
    238218,
    TO_DATE('2-Mar-2022 11:11:34', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('12-Apr-2022 9:34:44', 'DD-Mon-YYYY HH24:MI:SS'),
    134105,
    1033
);

INSERT INTO admission VALUES (
    238219,
    TO_DATE('10-Feb-2022 12:05:16', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('15-Mar-2022 17:22:33', 'DD-Mon-YYYY HH24:MI:SS'),
    134104,
    1018
);

INSERT INTO admission VALUES (
    238220,
    TO_DATE('11-Jan-2022 11:11:34', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('15-May-2022 9:34:44', 'DD-Mon-YYYY HH24:MI:SS'),
    134105,
    1018
);

INSERT INTO admission VALUES (
    238221,
    TO_DATE('11-Jan-2022 11:11:34', 'DD-Mon-YYYY HH24:MI:SS'),
    TO_DATE('15-May-2022 9:34:44', 'DD-Mon-YYYY HH24:MI:SS'),
    134105,
    1033
);

/*Adding 20 admission procedures to the Admission Procedure table */
INSERT INTO adm_prc (
    adprc_no,
    adprc_date_time,
    adprc_pat_cost,
    adprc_items_cost,
    adm_no,
    proc_code,
    request_dr_id,
    perform_dr_id
) VALUES (
    7365300,
    TO_DATE('15-Feb-2022 13:04:37', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238214,
    12055,
    1005,
    1056
);

INSERT INTO adm_prc VALUES (
    7365301,
    TO_DATE('02-Feb-2022 12:03:22', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238210,
    15509,
    1048,
    1033
);

INSERT INTO adm_prc VALUES (
    7365302,
    TO_DATE('5-Mar-2022 15:10:30', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238204,
    15511,
    1027,
    1018
);

INSERT INTO adm_prc VALUES (
    7365303,
    TO_DATE('11-May-2022 11:11:20', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238212,
    23432,
    1018,
    1018
);

INSERT INTO adm_prc VALUES (
    7365304,
    TO_DATE('15-Jun-2022 19:10:23', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238202,
    27459,
    1061,
    1064
);

INSERT INTO adm_prc VALUES (
    7365305,
    TO_DATE('10-Feb-2022 16:14:11', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238205,
    40100,
    1064,
    1064
);

INSERT INTO adm_prc VALUES (
    7365306,
    TO_DATE('2-May-2022 17:18:07', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238200,
    33335,
    1012,
    1018
);

INSERT INTO adm_prc VALUES (
    7365307,
    TO_DATE('3-Feb-2022 13:11:22', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238207,
    65554,
    1028,
    1028
);

INSERT INTO adm_prc VALUES (
    7365308,
    TO_DATE('10-Jun-2022 12:12:7', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238208,
    23432,
    1005,
    1005
);

INSERT INTO adm_prc VALUES (
    7365309,
    TO_DATE('15-Feb-2022 16:16:26', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238209,
    40099,
    7890,
    7890
);

INSERT INTO adm_prc VALUES (
    7365310,
    TO_DATE('6-Apr-2022 15:04:45', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238205,
    15510,
    7900,
    7900
);

INSERT INTO adm_prc VALUES (
    7365311,
    TO_DATE('11-Jun-2022 15:20:26', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238203,
    29844,
    1061,
    1064
);

INSERT INTO adm_prc VALUES (
    7365312,
    TO_DATE('15-Feb-2022 22:23:37', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238201,
    49518,
    1028,
    1005
);

INSERT INTO adm_prc VALUES (
    7365313,
    TO_DATE('2-Mar-2022 19:11:37', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238209,
    27459,
    1099,
    1099
);

INSERT INTO adm_prc VALUES (
    7365314,
    TO_DATE('10-Feb-2022 20:11:20', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238206,
    40099,
    1056,
    1060
);

INSERT INTO adm_prc VALUES (
    7365315,
    TO_DATE('15-Feb-2022 12:22:30', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238202,
    15511,
    1060,
    1061
);

INSERT INTO adm_prc VALUES (
    7365316,
    TO_DATE('11-May-2022 20:04:20', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238203,
    43556,
    1064,
    1064
);

INSERT INTO adm_prc VALUES (
    7365317,
    TO_DATE('1-Jun-2022 15:23:45', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238214,
    17122,
    1084,
    1084
);

INSERT INTO adm_prc VALUES (
    7365318,
    TO_DATE('10-Jun-2022 12:02:12', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238201,
    33335,
    1005,
    1005
);

INSERT INTO adm_prc VALUES (
    7365319,
    TO_DATE('12-Mar-2022 19:19:45', 'DD-Mon-YYYY HH24:MI:SS'),
    67457.00,
    7689.00,
    238202,
    71432,
    1095,
    1095
);


/*Adding 15 items to the item_treatments table */
INSERT INTO item_treatment (
    adprc_no,
    item_code,
    it_qty_used,
    it_item_total_cost
) VALUES (
    7365302,
    'NE001',
    44,
    635543.11
);

INSERT INTO item_treatment VALUES (
    7365300,
    'CF050',
    47,
    635478.27
);

INSERT INTO item_treatment VALUES (
    7365309,
    'LB250',
    56,
    634367.33
);

INSERT INTO item_treatment VALUES (
    7365319,
    'KN056',
    17,
    63548.2
);

INSERT INTO item_treatment VALUES (
    7365317,
    'EA030',
    90,
    465478.4
);

INSERT INTO item_treatment VALUES (
    7365316,
    'TE001',
    23,
    87678.12
);

INSERT INTO item_treatment VALUES (
    7365310,
    'AN002',
    45,
    87478.8
);

INSERT INTO item_treatment VALUES (
    7365313,
    'LB250',
    78,
    87642.5
);

INSERT INTO item_treatment VALUES (
    7365308,
    'SS006',
    77,
    235781.34
);

INSERT INTO item_treatment VALUES (
    7365303,
    'OV001',
    5,
    1352.1
);

INSERT INTO item_treatment VALUES (
    7365307,
    'CA002',
    14,
    2347.02
);

INSERT INTO item_treatment VALUES (
    7365316,
    'KN056',
    10,
    98756.45
);

INSERT INTO item_treatment VALUES (
    7365311,
    'OV001',
    12,
    45289.12
);

INSERT INTO item_treatment VALUES (
    7365316,
    'CE001',
    1,
    8947.11
);

INSERT INTO item_treatment VALUES (
    7365305,
    'KN056',
    19,
    1252.23
);

COMMIT;
/*The script must contain a single COMMIT statement as the last line of the script */