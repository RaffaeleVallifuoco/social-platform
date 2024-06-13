use social_platform;




# Seleziona gli utenti che hanno postato almeno un video

SELECT *
FROM users u 
join medias m  on m.user_id = u.id 
where m.`type` = "video" ;



# Seleziona tutti i post senza Like 

SELECT p.*
FROM posts p 
LEFT JOIN likes l ON p.id = l.post_id
WHERE l.post_id IS NULL;




#Conta il numero di like per ogni post 

SELECT l.post_id , COUNT(*) 
FROM likes l 
GROUP BY l.post_id ;



# Ordina gli utenti per il numero di media caricati 

SELECT u.username, COUNT(m.user_id) AS media_count
FROM users u
JOIN medias m ON m.user_id = u.id
GROUP BY u.username
ORDER BY media_count ASC;



# Ordina gli utenti per totale di likes ricevuti nei loro posts 

SELECT u.username, COUNT(l.post_id) AS like_count
from users u 
join posts p on p.user_id = u.id 
join likes l on l.post_id = p.id 
GROUP  BY  u.username
ORDER BY like_count;


