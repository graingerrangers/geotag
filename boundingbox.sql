DELIMITER //
CREATE PROCEDURE kmeans(v_K int)
BEGIN
TRUNCATE km_clusters;
-- initialize cluster centers
INSERT INTO km_clusters SELECT tag, AVG(coord_x), AVG(coord_y) FROM geotag_locations GROUP BY tag;
REPEAT
    -- assign clusters to data points
    UPDATE geotag_locations d SET assigned_tag = (SELECT tag FROM km_clusters c
        ORDER BY POW(d.coord_x-c.x,2)+POW(d.coord_y-c.y,2) ASC LIMIT 1);
    -- calculate new cluster center
    UPDATE km_clusters C, (SELECT tag,
        AVG(coord_x), AVG(coord_y)
        FROM km_data GROUP BY tag) D
    SET C.x=D.coord_x, C.y=D.coord_y WHERE C.tag=D.tag;
UNTIL ROW_COUNT() = 0 END REPEAT;
END;//
