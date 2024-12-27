-----Q2 Return all the track names that have a song longer the average song length. Return the Name and millisecs for each track. Order by the song length with the longest song  listed first.
 SELECT DISTINCT name, count(artist.artist_id) as no_of_songs
FROM artist
JOIN album ON artist.artist_id= album.artist_id
WHERE album_id in (
SELECT album_id FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock')
group by artist.artist_id
order by no_of_songs desc
limit  10
;
