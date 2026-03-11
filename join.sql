-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.name, S.surname, S.id student_id, D.name, D.id degree_id
FROM students S
JOIN degrees D
ON S.degree_id=D.id
WHERE  D.id=53;

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
-- Neuroscienze
SELECT DEG.ID DEGREE_ID, DEG.NAME, DEG.level, DEP.id department_id, DEP.NAME
FROM degrees DEG
JOIN departments DEP
ON DEG.department_id = DEP.id
WHERE DEG.LEVEL = 'MAGISTRALE'
AND DEP.ID = 7;

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
-- nome

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di
-- Matematica (54)

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18.