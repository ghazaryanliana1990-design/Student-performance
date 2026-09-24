SELECT * FROM studentperformance
LIMIT 10

--Միջին միավորները ըստ նախապատրաստական դասընթացի․
SELECT 
test_preparation_course, AVG(math_score), AVG(reading_score),
AVG(writing_score) FROM studentperformance GROUP BY test_preparation_course;


--Միջին միավորները՝ ըստ ծնողների կրթության մակարդակի.

⁠SELECT parental_level_of_education, AVG(math_score), AVG(reading_score), 
AVG(writing_score) FROM studentperformance GROUP BY parental_level_of_education;

--Միջին միավորները ըստ սեռի․
SELECT gender,AVG(math_score),AVG(reading_score),AVG(writing_score)FROM studentperformance 
GROUP BY gender

--Լանչի տեսակի ազդեցությունը ուսանողների միջին միավորների վրա․

SELECT lunch,
AVG (math_score),AVG(reading_score),AVG(writing_score)
FROM studentperformance 
GROUP BY lunch;

--միջին միավորները ըստ ռասայական պատկանելության․

SELECT "race_ethnicity", 
AVG(math_score), AVG(reading_score), AVG(writing_score) FROM studentperformance 
GROUP BY "race_ethnicity";

--Քանի ուսանող է ստացել 100 միավոր մաթեմատիկայից․

SELECT COUNT(*)
FROM studentperformance
WHERE math_score = 100

--Քանի ուսանող է ստացել 100 միավոր ընթերցանությունից և գրավորից․

SELECT COUNT(*) 
FROM studentperformance 
WHERE reading_score = 100 OR writing_score = 100;


--Top 5 ուսանողները (ըստ ընդհանուր միավորի)
Հաշվում է 3 առարկաների գումարային միավորը և ցույց տալիս լավագույն 5 արդյունքը․

SELECT *, (math_score + reading_score + writing_score) AS total_score
FROM studentperformance
ORDER BY total_score DESC
LIMIT 5;

--յուրաքանչյուր ուսանողի ընդհանուր միավորը և դասակարգում նրանց ըստ արդյունքների՝ 
--առանձնացնելով գերազանց, լավ և միջին կատարողական ունեցողներին։

SELECT *, (math_score + reading_score + writing_score) AS total_score, 
CASE WHEN (math_score + reading_score +writing_score) >= 270 THEN 'Excellent' 
WHEN (math_score +reading_score + writing_score) >= 220 THEN 'Good' ELSE 'Average'
END AS performance_category 
FROM studentperformance;


--յուրաքանչյուր ուսանողի ընդհանուր միավորի համեմատումը իր սեռի միջին ընդհանուր միավորի հետ․

SELECT 
sp.gender,
sp.math_score,
sp.reading_score,
sp.writing_score,
(sp.math_score + sp.reading_score + sp.writing_score) AS total_score,
g_avg.avg_total_score AS gender_avg_total_score
FROM 
studentperformance sp
JOIN 
(
SELECT 
gender,
AVG(math_score + reading_score + writing_score) AS avg_total_score
FROM 
studentperformance
GROUP BY 
gender
) g_avg 
ON sp.gender = g_avg.gender;⁠




