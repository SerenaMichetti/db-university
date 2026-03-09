-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*), year(ENROLMENT_DATE) 
FROM students
GROUP BY year(ENROLMENT_DATE) 
ORDER BY year(ENROLMENT_DATE);
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT count(*), office_address
FROM teachers
GROUP BY office_address;
-- 3. Calcolare la media dei voti di ogni appello d'esame
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento