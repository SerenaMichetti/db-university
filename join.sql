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
SELECT T.ID teacher_id, T.name, T.surname, C.ID course_id, C.name
FROM teachers T
JOIN course_teacher CT
ON T.id= CT.teacher_id
JOIN courses C
ON C.ID = CT.course_id
WHERE T.ID = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
-- nome
SELECT S.id students_ID, S.surname, S.name, DEG.name DEGREE_NAME, DEP.name DEPARTMENT_NAME
FROM students S
JOIN degrees DEG
ON S.degree_id = DEG.id
JOIN departments DEP
ON DEG.department_id = DEP.id
ORDER BY S.surname, S.name ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT DEG.name, C.name, T.name, T.surname
FROM degrees DEG
JOIN courses C
ON C.degree_id = DEG.id
JOIN course_teacher CT
ON CT.course_id = C.id
JOIN teachers T
ON CT.teacher_id = T.id;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di
-- Matematica (54)
SELECT T.*
FROM teachers T
JOIN course_teacher CT
ON T.id = CT.teacher_id
JOIN courses C
ON CT.course_id = C.id
JOIN degrees DEG 
ON C.degree_id = DEG.id
JOIN departments DEP
ON DEG.department_id = DEP.id
WHERE DEP.name = 'Dipartimento di Matematica'
GROUP BY T.id
ORDER BY T.id;

-- 7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18.
SELECT S.id student_id, S.name, S.surname, C.name, COUNT(*) NUMERO_TENTATIVI, MAX(vote) VOTO_MASSIMO
FROM students S
JOIN exam_student ES
ON ES.student_id = S.id
JOIN exams E
ON ES.exam_id = E.id
JOIN courses C 
ON E.course_id = C.id
GROUP BY S.id, C.id
HAVING MAX(vote) >= 18
ORDER BY S.id



