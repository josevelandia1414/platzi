/*
punto 1 
--selecionado nuestras tablas
*/

select * from album
select * from artist
select * from Customer
select * from genre
select * from invoice 
select * from invoiceLine 
select * from MediaType
select * from Playlist
select * from PlaylistTrack
select * from Track

/*
punto 2
-- buscar clientes con el mismo pais 

buscamos que pais tine mas cleintes , luego traemos el de canda que es els eugn con mas clientes 
*/


select Country, count(*) as total_country 
from customer
group by Country 
order  by total_country desc;


SELECT CustomerId, FirstName, LastName, Country
FROM customer
WHERE Country = 'Canada';


/*

punto 3 

-- buscar cleintes que itne la letra a 
--filtrar facturas cuyos tyotlaes entre 5 20 

*/


select  FirstName 
from customer 
where  FirstName  like '%a%' 

SELECT Total
FROM Invoice
ORDER BY Total ASC;


SELECT MIN(TotalAmount) AS MinTotal, MAX(TotalAmount) AS MaxTotal
FROM (
    SELECT CustomerId, SUM(Total) AS TotalAmount
    FROM Invoice
    GROUP BY CustomerId
) AS Subquery;

SELECT CustomerId, SUM(Total) AS TotalAmount_idcostumer
FROM Invoice
GROUP BY Customerid
HAVING SUM(Total) BETWEEN 36.64 AND 40;


/*punto 4


Practicar el uso de INNER JOIN para combinar datos de dos tablas

        El nombre de la canción (Name de la tabla tracks).
	    El título del álbum al que pertenece (Title de la tabla albums).
*/


select * from Track
select * from genre


SELECT genre.Name AS GenreName, COUNT(track.TrackId) AS TotalTracks
FROM track
INNER JOIN genre ON track.GenreId = genre.GenreId
GROUP BY genre.Name
ORDER BY TotalTracks DESC;

SELECT 
    track.TrackId,
    track.Name AS TrackName,
    track.GenreId, -- Mantienes el identificador de género
    genre.Name AS Genre, -- Nueva columna con el nombre del género
    track.Composer,
    track.Milliseconds,
    track.Bytes,
    track.UnitPrice
FROM track
INNER JOIN genre ON track.GenreId = genre.GenreId;

select * from track
select * from album


select  
track.TrackId,
track.Name,
track.AlbumId as album_id,
track.MediaTypeId,
track.GenreId,
track.Composer,
track.Milliseconds,
track.Bytes,
track.UnitPrice,
Album.Title as albumname
from Track
left join album on Track.AlbumId =Album.AlbumId
order by albumname desc


  