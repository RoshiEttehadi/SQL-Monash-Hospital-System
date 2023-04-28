# SQL-Monash-Hospital-System
populate resultant tables with appropriate test data and write the SQL queries speciﬁed for a brief from Monash Hospital.
Monash Hospital brief
 
Monash Hospital treats patients who are identified by a unique patient ID. When a patient is admitted to the hospital, the hospital records the patient’s first and last name, address, date of birth and emergency contact number (if they are not already on the system). They also record the date and time of admission. The system needs to maintain a record of all admissions for a particular patient. When a patient is discharged, the date and time of their discharge for this admission is recorded. This system only deals with inpatients i.e. patients who are formally admitted to the hospital and stay for at least one night.

Hospital administrator looking over form
While in the hospital each patient is assigned one doctor (identified by a doctor ID) as their supervising doctor. A patient's supervising doctor may be in charge of many admissions. The hospital records each doctor's first and last names and phone numbers. A doctor may have one or more specialisations (eg. Orthopaedic, Renal), but not all doctors who work at the hospital have a specialisation.
During their time in the hospital (admission), patients are prescribed procedures as part of their care by doctors. Procedures consist of tests such as 'X-Rays' or 'Blood Tests'. They also include medical procedures which might be required such as 'Shoulder Replacement'. A patient may have procedures prescribed by their supervising doctor or any other doctor working in the hospital.
A procedure is identified by a procedure code. Each procedure has a name (such as 'Wrist X-Ray') and includes a description of what the procedure involves, the time required for the procedure and the current standard patient cost for this procedure.    When a particular procedure is prescribed during a patient’s admission, the date and time when the procedure is carried out are also recorded. A particular procedure is completed before any further procedures are run (two procedures cannot occur simultaneously). Some procedures, such as blood tests are carried out by technicians, more complex procedures may require a doctor to carry out the procedure.
If a procedure is carried out by a technician the hospital does not record the details of the technician who completed the procedure.
If a doctor carries out the procedure, the doctor who completes the procedure is recorded (the doctor who completes the procedure may be different from the doctor who prescribes it). Even if a team of doctors is involved in the procedure, only one doctor (the doctor in charge) is recorded as completing the procedure.
Monash Hospital only records the details of a procedure carried out on an admission after the procedure has been completed.
Not all admissions require a procedure to be carried out.
Procedures may require 'extra' items such as syringes or swabs. Each item held in stock is assigned an item code. The item description, current stock and price are recorded. For accounting purposes, each item is assigned to a unique cost centre, such as Pharmacy, Radiography or Patient Aids. A cost centre is identified by a cost centre code and has recorded the cost centre title and manager's name. The quantity of each item used in a particular procedure is recorded.
Patients are billed for the cost for the procedure itself and also any "extra" items which are used as part of a procedure. The billed charge is based on the procedure/item cost at the date and time of the procedure. A particular patient may be charged at a rate different from the standard procedure cost or standard item cost at the doctors/hospital's discretion.
