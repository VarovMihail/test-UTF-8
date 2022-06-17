--���������� ������������ � ������ �����
SELECT g.name genre, count(*)   FROM genre g
FULL JOIN artist_genre ag ON g.id = ag.genre_id
FULL JOIN artist a ON a.id = ag.artist_id
GROUP BY genre
ORDER BY genre;

--���������� ������, �������� � ������� 2019-2020 �����
SELECT count(*) FROM album a
FULL JOIN song s ON a.id = s.album_id
WHERE "year" BETWEEN 2019 AND 2020;

--������� ����������������� ������ �� ������� �������
SELECT a.name album_name, avg(s.length) FROM album a
FULL JOIN song s ON a.id = s.album_id 
GROUP BY album_name;

--��� �����������, ������� �� ��������� ������� � 2020 ����
SELECT a.name artist_name FROM artist a
FULL JOIN artist_album aa ON a.id = aa.artist_id 
FULL JOIN album ON aa.album_id = album.id 
WHERE "year" <> 2020;

--�������� ���������, � ������� ������������ ���������� ����������� (�������� ����)
SELECT c.name collection_name FROM collection c 
FULL JOIN collection_song cs ON c.id = cs.collection_id 
FULL JOIN song s ON cs.song_id = s.id 
FULL JOIN album a ON s.album_id = a.id
FULL JOIN artist_album aa ON a.id = aa.album_id 
FULL JOIN artist ON artist.id = aa.artist_id 
WHERE artist.name = 'James Young';

--�������� ��������, � ������� ������������ ����������� ����� 1 �����
SELECT album.name album_name FROM artist_genre ag
FULL JOIN artist_album aa ON aa.artist_id = ag.artist_id
FULL JOIN album ON album.id = aa.album_id 
GROUP BY  album.name
HAVING  count(ag.artist_id)>1;

--������������ ������, ������� �� ������ � ��������
SELECT song.name song_name  FROM song 
LEFT JOIN collection_song cs ON cs.song_id = song.id 
WHERE song_id IS NULL 

--�����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������)
SELECT artist.name artist FROM artist 
FULL JOIN artist_album aa ON aa.artist_id = artist.id 
FULL JOIN album ON album.id = aa.album_id 
FULL JOIN song ON song.album_id = album.id 
WHERE length = (SELECT min(length) FROM song)

--�������� ��������, ���������� ���������� ���������� ������
SELECT album.name album_name FROM album
FULL JOIN song ON song.album_id = album.id 
GROUP BY album.name
HAVING count(*) = (SELECT min(xxx) FROM (SELECT count(*) AS xxx FROM song GROUP BY album_id)AS zzz);

--��� ��� ��������� ������ �����, ����� ������ �� ������������ ������










