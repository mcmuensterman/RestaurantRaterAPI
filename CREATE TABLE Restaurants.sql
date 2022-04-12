CREATE TABLE Restaurants
(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100) NOT NULL
);

CREATE TABLE Ratings
(
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    RestaurantId INT NOT NULL,
    Score FLOAT NOT NULL CHECK (Score >= 0.0 AND Score <= 5.0)
)

ALTER TABLE Ratings ADD FOREIGN KEY (RestaurantId)
REFERENCES Restaurants(Id)

INSERT INTO Restaurants
(Name, Location)
VALUES
('The Bistro', '12175 Visionary Way'),
('India Garden', '207 N Delaware Street'),
('Mcdonald''s', '8907 E 116th Street')

INSERT INTO Restaurants
(Name, Location)
VALUES
('Mongolian BBQ', '420 86th Street'),
('Old Town Tavern', '130 W Main Street'),
('The Metro Diner', '69 86th Street')

SELECT * FROM Restaurants

-- SELECT Name, Location FROM Restaurants

INSERT INTO Ratings
(RestaurantId, Score)
VALUES
(1,5), (1,3), (1,4), (1,5),
(2,5), (2,4), (2,5),
(3,5), (3,3), (3,4)


INSERT INTO Ratings
(RestaurantId, Score)
VALUES
(4,5), (4,3), (4,4), (4,5),
(5,5), (5,4), (5,5),
(6,5), (6,3), (6,4)

SELECT * FROM Ratings

SELECT Id, Score
FROM Ratings
WHERE RestaurantId = 2

SELECT AVG(Score) AS AverageRating
FROM Ratings
WHERE RestaurantId = 2

SELECT
    r.Id, r.Name,
    AVG(rt.Score) AS AverageRating
    FROM Restaurants r
    LEFT OUTER JOIN Ratings rt
    ON rt.RestaurantId = r.Id
    GROUP BY r.Id, r.Name
    ORDER BY AverageRating DESC