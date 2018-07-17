CREATE DATABASE IF NOT EXISTS policies;

USE policies;

CREATE TABLE IF NOT EXISTS balance (
  ID VARCHAR(255) NOT NULL,
  POLICY_ID VARCHAR(255),
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS inspection (
  ID VARCHAR(255) NOT NULL,
  COMMENTS VARCHAR(255),
  POLICY_ID VARCHAR(255),
  STATUS INTEGER,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS inspection$image_review (
  ID VARCHAR(255) NOT NULL,
  COMMENTS VARCHAR(255),
  IMAGE_DESCRIPTION VARCHAR(255),
  IMAGE_INDEX INTEGER,
  IMAGE_NAME VARCHAR(255),
  STATUS INTEGER,
  SUBJECT INTEGER,
  IMAGE_ID VARCHAR(255),
  INSPECTION_ID VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS inspection_image (
  ID VARCHAR(255) NOT NULL,
  POLICY_ID VARCHAR(255),
  SUBJECT INTEGER,
  URL VARCHAR(255),
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS period (
  ID VARCHAR(255) NOT NULL,
  PLAN_ID VARCHAR(255),
  DATE_FROM DATETIME,
  DATE_TO DATETIME,
  INSURED_PERSON VARCHAR(255),
  CITY VARCHAR(255),
  DEPARTMENT VARCHAR(255),
  FLOOR VARCHAR(50),
  NUMBER INTEGER,
  STATE VARCHAR(255),
  STREET VARCHAR(255),
  ZIP_CODE VARCHAR(255),
  POLICY_ID VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS period_coverables (
  PERIOD_ID VARCHAR(255) NOT NULL,
  ID VARCHAR(255),
  STATED_AMOUNT DOUBLE PRECISION);

CREATE TABLE IF NOT EXISTS period_policy_coverages (
  PERIOD_ID VARCHAR(255) NOT NULL,
  CATEGORY INTEGER,
  DESCRIPTION VARCHAR(255),
  ID VARCHAR(255),
  NAME VARCHAR(255),
  OPTION_ID VARCHAR(255),
  BASE_PRICE DECIMAL(19,2),
  TAX DECIMAL(19,2),
  TERM_PRICE DECIMAL(19,2),
  TOTAL_PRICE DECIMAL(19,2),
  TERM_TYPE INTEGER,
  VALUE VARCHAR(255),
  VALUE_TYPE INTEGER);

CREATE TABLE IF NOT EXISTS policy (
  ID VARCHAR(255) NOT NULL,
  ACCOUNT_ID VARCHAR(255),
  PACKAGE_ID VARCHAR(255),
  POLICY_NUMBER VARCHAR(255),
  POLICY_TERM INTEGER,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS remaining_balance (
  COVERAGE VARCHAR(255) NOT NULL,
  VALUE VARCHAR(255),
  NAME VARCHAR(255) NOT NULL,
  PRIMARY KEY (COVERAGE, NAME));

ALTER TABLE balance ADD CONSTRAINT POLICY_PK UNIQUE (POLICY_ID);
ALTER TABLE inspection$image_review ADD CONSTRAINT IMAGE_INSPECTION_FK FOREIGN KEY (IMAGE_ID) REFERENCES inspection_image (ID);
ALTER TABLE inspection$image_review ADD CONSTRAINT INSPECTION_FK FOREIGN KEY (INSPECTION_ID) REFERENCES inspection (ID);
ALTER TABLE period ADD CONSTRAINT POLICY_FK FOREIGN KEY (POLICY_ID) REFERENCES policy (ID);
ALTER TABLE period_coverables ADD CONSTRAINT PERIOD_COVERABLES_FK FOREIGN KEY (PERIOD_ID) REFERENCES period (ID);
ALTER TABLE period_policy_coverages ADD CONSTRAINT PERIOD_COVERAGES_FK FOREIGN KEY (PERIOD_ID) REFERENCES period (ID);
ALTER TABLE remaining_balance ADD CONSTRAINT BALANCE_FK FOREIGN KEY (COVERAGE) REFERENCES balance (ID);

CREATE TABLE IF NOT EXISTS balance (
  ID VARCHAR(255) NOT NULL,
  POLICY_ID VARCHAR(255),
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS inspection (
  ID VARCHAR(255) NOT NULL,
  COMMENTS VARCHAR(255),
  POLICY_ID VARCHAR(255),
  STATUS INTEGER,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS inspection$image_review (
  ID VARCHAR(255) NOT NULL,
  COMMENTS VARCHAR(255),
  IMAGE_DESCRIPTION VARCHAR(255),
  IMAGE_INDEX INTEGER,
  IMAGE_NAME VARCHAR(255),
  STATUS INTEGER,
  SUBJECT INTEGER,
  IMAGE_ID VARCHAR(255),
  INSPECTION_ID VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS inspection_image (
  ID VARCHAR(255) NOT NULL,
  POLICY_ID VARCHAR(255),
  SUBJECT INTEGER,
  URL VARCHAR(255),
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS period (
  ID VARCHAR(255) NOT NULL,
  DATE_FROM DATETIME,
  DATE_TO DATETIME,
  INSURED_PERSON VARCHAR(255),
  CITY VARCHAR(255),
  DEPARTMENT VARCHAR(255),
  FLOOR INTEGER,
  NUMBER INTEGER,
  STATE VARCHAR(255),
  STREET VARCHAR(255),
  ZIP_CODE VARCHAR(255),
  POLICY_ID VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS period_coverables (
  PERIOD_ID VARCHAR(255) NOT NULL,
  ID VARCHAR(255),
  STATED_AMOUNT DOUBLE PRECISION);

CREATE TABLE IF NOT EXISTS period_policy_coverages (
  PERIOD_ID VARCHAR(255) NOT NULL,
  CATEGORY INTEGER,
  DESCRIPTION VARCHAR(255),
  ID VARCHAR(255),
  NAME VARCHAR(255),
  OPTION_ID VARCHAR(255),
  BASE_PRICE DECIMAL(19,2),
  TAX DECIMAL(19,2),
  TERM_PRICE DECIMAL(19,2),
  TOTAL_PRICE DECIMAL(19,2),
  TERM_TYPE INTEGER,
  VALUE VARCHAR(255),
  VALUE_TYPE INTEGER);

CREATE TABLE IF NOT EXISTS policy (
  ID VARCHAR(255) NOT NULL,
  ACCOUNT_ID VARCHAR(255),
  PACKAGE_ID VARCHAR(255),
  POLICY_NUMBER VARCHAR(255),
  POLICY_TERM INTEGER,
  PRIMARY KEY (ID));

CREATE TABLE IF NOT EXISTS remaining_balance (
  COVERAGE VARCHAR(255) NOT NULL,
  VALUE VARCHAR(255),
  NAME VARCHAR(255) NOT NULL,
  PRIMARY KEY (COVERAGE, NAME));

ALTER TABLE inspection ADD COLUMN VALID_TO DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE period ADD COLUMN CANCEL_DATE  DATETIME DEFAULT NULL;

CREATE TABLE IF NOT EXISTS endorsement (
  ID VARCHAR (255) NOT NULL,
  DETAIL VARCHAR (255),
  ENDORSEMENT_TYPE INTEGER ,
  ISSUED_DATE DATETIME,
  ENDORSEMENT_NUMBER INTEGER ,
  PERIOD_ID VARCHAR (255),
  PRIMARY KEY (id));

ALTER TABLE endorsement ADD CONSTRAINT PERIOD_FK FOREIGN KEY (PERIOD_ID) REFERENCES period (ID);
ALTER TABLE policy ADD LAST_ENDORSEMENT_NUMBER INTEGER DEFAULT -1;
ALTER TABLE period DROP COLUMN CANCEL_DATE;

ALTER TABLE inspection ADD COLUMN EXTERNAL_ID VARCHAR(255) DEFAULT NULL;

ALTER TABLE period_policy_coverages ADD COLUMN RAW_CHARGES VARCHAR(1024) NULL DEFAULT NULL AFTER VALUE_TYPE;

CREATE TABLE IF NOT EXISTS product_catalog (
  CODE VARCHAR (50) NOT NULL,
  NAME VARCHAR (255) NOT NULL,
  PRIMARY KEY (CODE)
);

ALTER TABLE policy ADD COLUMN LICENSE_PLATE VARCHAR(256) NULL DEFAULT NULL AFTER ACCOUNT_ID;

ALTER TABLE policies.policy ADD COLUMN ORGANIZATION VARCHAR(256) DEFAULT NULL;

UPDATE policies.policy SET ORGANIZATION = 'IUNIGO';

ALTER TABLE product_catalog
  ADD COLUMN DESCRIPTION VARCHAR(255) NOT NULL AFTER NAME,
  ADD COLUMN CATEGORY VARCHAR(50) NOT NULL AFTER DESCRIPTION;

INSERT INTO `product_catalog` VALUES 
('CER','Cerradura','Si se te rompe la cerradura, o te la fuerzan, te cubrimos las veces que lo necesites.','COVERAGE'),
('CRISFRONT','Parabrisa/Luneta','Cubre el parabrisa y la luneta de tu auto. Las veces que lo necesites.','COVERAGE'),
('CRISLAT','Cristales Laterales','Cubre todos los cristales laterales de tu auto. Las veces que lo necesites.','COVERAGE'),
('CRISTECHO','Techo','Si tenés vidrio de techo también lo cubrimos. Las veces que lo necesites.','COVERAGE'),
('DP','Daño Parcial','Si tenés un daño parcial en tu auto lo cubrimos. Seleccioná la franquicia que prefieras. La franquicia es la cantidad que deberás pagar en caso de que ocurra un daño.','COVERAGE'),
('DPROBO','Daños parciales al amparo del Robo Total','Daños parciales al amparo del Robo Total','COVERAGE'),
('DT','Daño Total','Además de la protección legal, cubrimos destrucción de más del 80% de tu auto por daños.','COVERAGE'),
('GESTORIA','Reintegro por Gastos de Gestoría','Si ocurre un siniestro total (robo, daño, incendio), los gastos de gestoría para dar de baja el auto estarán cubiertos.','SERVICE'),
('GRANIZO','Granizo','Esta cobertura protege tu auto en caso de que sea afectado por el granizo. Sin límites por cantidad de bollos.','COVERAGE'),
('GRUA','Grúa','¿Se te quedó el auto? ¿Necesitas una grúa? Te cubrimos remolque en grúa o auxilio en moto según lo que necesites todas las veces que lo necesites.','ASSISTANCE'),
('INU','Inundación','Además de la protección legal, cubrimos destrucción de más del 80% de tu auto por robo.','COVERAGE'),
('IP','Incendio Parcial','Cubrimos daño parcial por incendio. Es decir, si te incendia una parte de tu auto lo cubrimos totalemente.','COVERAGE'),
('IT','Incendio Total','Además de la protección legal, cubrimos destrucción de más del 80% de tu auto por incendio.','COVERAGE'),
('MECLIG','Mecánica Ligera','¿Se te pinchó una rueda?¿Te quedaste sin combustible?¿Te quedaste sin batería? para eso y mucho más tu auto está cubierto.','ASSISTANCE'),
('MI','Muerte e Invalidez - Conductor','En caso que ocurra lo peor, además de asistencia legal tenés una indemnización de $30.000.','COVERAGE'),
('MIF','Muerte e Invalidez - Familia','En caso de que lleves hasta 4 acompañantes, además de asistencia legal, tendrán una indemnización de hasta $30.000.','COVERAGE'),
('RC','Responsabilidad Civil','Cubrimos los daños que puedas causarle con tu auto a terceras personas o a sus bienes (casa, auto o negocio). Además te protege cuando causas lesiones corporales o la muerte a terceras personas. Hasta $6.000.000 por evento.','COVERAGE'),
('RP','Robo Parcial','Cubrimos daño parcial por robo. Es decir, si te roban una parte de tu auto lo cubrimos totalemente. Incluye robo de ruedas, las veces que lo necesites.','COVERAGE'),
('RT','Robo Total','Además de la protección legal, cubrimos destrucción de más del 80% de tu auto por robo.','COVERAGE'),
('RUEDAS','Ruedas','Cubrimos robo de ruedas, las veces que lo necesites.','COVERAGE');


ALTER TABLE policy ADD COLUMN CREATION_DATE DATETIME NOT NULL DEFAULT NOW();

CREATE TABLE claim_type(
  CODE INTEGER NOT NULL,
  DESCRIPTION VARCHAR(255),
  INSURANCE_PRODUCT_CODE VARCHAR(255),
  PRIMARY KEY (CODE)
);

ALTER TABLE claim_type ADD CONSTRAINT FK_PRODUCT_CODE FOREIGN KEY (INSURANCE_PRODUCT_CODE) REFERENCES product_catalog (CODE);

INSERT INTO `claim_type` VALUES 
(101,'Lesiones a Terceros Transportados LEVE','RC'),
(102,'Lesiones a Terceros Transportados MEDIA','RC'),
(103,'Lesiones a Terceros Transportados GRAVE','RC'),
(104,'Muerte a Terceros Transportados','RC'),
(105,'Muerte e Invalidez Conductor','MI'),
(106,'Muerte e Invalidez Familiares/ acompaÒante','MIF'),
(107,'LESIÓN DE FAMILIAR EN VEHÍCULO ASEGURADO','MIF'),
(108,'LESIÓN DE CONDUCTOR DEL VEHÍCULO ASEGURADO','MI'),
(201,'Lesiones a Terceros no Transportados LEVE','RC'),
(202,'Lesiones a Terceros no Transportados MEDIA','RC'),
(203,'Lesiones a Terceros no Transportados GRAVE','RC'),
(204,'Muerte a Terceros no Transportados','RC'),
(301,'Dano Auto del Tercero/ cosa del tercero','RC'),
(402,'Robo/ hurto Ruedas de auxilios ','RUEDAS'),
(403,'Robo/ hurto Ruedas de posicion','RUEDAS'),
(404,'Robo y/o Hurto de Partes Externas','RP'),
(501,'Robo y/o Hurto Total Mano Armada','RT'),
(502,'Robo y/o Hurto Total Estacionado','RT'),
(503,'Robo y/o Hurto Total Garage y/o Shopping','RT'),
(504,'Robo Aparecido sin Faltantes','RT'),
(505,'Robo Aparecido con Faltantes','RT'),
(601,'Incendio Parcial ','IP'),
(701,'Incendio Total Causa Fortuita','IT'),
(702,'Incendio Total Causa Terceros','IT'),
(801,'Danos Parciales por Accidente','DP'),
(802,'Parabrisas o Lunetas','CRISFRONT'),
(803,'Cristales Laterales por Robo','CRISLAT'),
(804,'Cristales Laterales por Accidente','CRISLAT'),
(805,'Cerraduras por Robo','CER'),
(806,'Cerraduras por Accidente','CER'),
(807,'DAÑO PARCIAL AL VEHÍCULO ASEGURADO ','GRANIZO'),
(808,'Daños por inundacion','INU'),
(809,'Daños al amparo del Robo/Hurto Aparecido','DPROBO'),
(810,'Cristal del techo','CRISTECHO'),
(900,'Remolque y/o mecanica ligera','GRUA'),
(901,'Danos Totales por Accidente Tecnica','DT'),
(903,'Danos Totales por evento climatico','DT');
