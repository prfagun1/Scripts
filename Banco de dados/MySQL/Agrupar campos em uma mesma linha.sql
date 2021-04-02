SELECT 
   u.username,
   group_concat(a.applicationId SEPARATOR ', ')
FROM useraccess u
INNER JOIN useraccess a ON a.username = u.username
where u.username like '%teste%'
GROUP BY u.username, a.applicationId
ORDER BY 1;