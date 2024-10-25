--insert new event for Fluffy
INSERT INTO petEvent VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');


--add Hammy to petPet
INSERT INTO petPet VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);


--insert Hammy's vet event
INSERT INTO petEvent VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');


--update Fluffy's number of kittens
INSERT INTO petEvent VALUES ('Fluffy', '2020-10-15', 'litter', '5 kittens, 2 male');

--insert Claws' injury event
INSERT INTO petEvent VALUES ('Claws', '1997-08-03', 'vet', 'broken rib');


--update Puffball's status to deceased
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

--remove Harold's dog 
DELETE FROM petPet
WHERE petname = 'Buffy' AND owner = 'Harold';
