USE policies;

ALTER TABLE period add column HAS_GNC TINYINT;
ALTER TABLE period add column IS_0KM TINYINT;
ALTER TABLE period add column VIN VARCHAR(255);
ALTER TABLE period add column ENGINE_NUMBER VARCHAR(255);
