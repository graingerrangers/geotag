CREATE PROCEDURE heatmap(user_id VARCHAR(30))
BEGIN

SET @friends = SELECT user2_id FROM (SELECT * FROM geotag_users INNER JOIN  geotag_is_friend WHERE geotag_users.fb_id = geotag_is_friend.user1_id) t WHERE user1_id = user_id;

SET @events_visited = SELECT DISTINCT event_id FROM 
(SELECT user2_id AS user FROM 
	(SELECT * FROM geotag_users INNER JOIN  geotag_is_friend WHERE geotag_users.fb_id = geotag_is_friend.user1_id) t WHERE user1_id = user_id) t2 
INNER JOIN 
geotag_is_attending WHERE geotag_is_attending.user_id = user; 


-- FINAL QUERY BELOW

SELECT DISTINCT * from (

SELECT * FROM geotag_events WHERE event_id IN (SELECT DISTINCT event_id AS event FROM 
(SELECT user2_id FROM 
	(SELECT * FROM geotag_users INNER JOIN  geotag_is_friend WHERE geotag_users.fb_id = geotag_is_friend.user1_id) t WHERE user1_id = 'astha2') t2 
INNER JOIN 
geotag_is_attending WHERE geotag_is_attending.user_id = t2.user2_id)

) t3 INNER JOIN geotag_locations WHERE geotag_locations.location_id = t3.location_id_id;


