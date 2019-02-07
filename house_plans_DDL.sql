
CREATE TABLE client
  (
    id_client INT IDENTITY (1,1) PRIMARY KEY,
    first_name      VARCHAR (15) NOT NULL ,
    second_name  VARCHAR (25) NOT NULL ,
    phone    INT NOT NULL UNIQUE,
    email     VARCHAR (25) NOT NULL UNIQUE
  ) ;



CREATE TABLE house_plan
  (
    id_plan          INT IDENTITY (1,1) PRIMARY KEY,
    name               VARCHAR (30) NOT NULL UNIQUE,
    build_cost        INT NOT NULL ,
    plan_price       INT DEFAULT 2000 NOT NULL ,
    id_architect       INT NOT NULL ,
    id_material INT NOT NULL
  ) ;

  CREATE INDEX house_plan__IDX ON house_plan
  ( build_cost ASC
  ) ;

  CREATE TABLE sold_plans
  (
    id_plan         INT IDENTITY (1,1) PRIMARY KEY,
    id_client          INT NOT NULL,
    pplan_id_plan INT NOT NULL,
    client_id_client   INT NOT NULL
  ) ;
ALTER TABLE sold_plans ADD CONSTRAINT sold_plans_PK PRIMARY KEY ( id_plan, id_client ) ;



CREATE TABLE architect
  (
    id_architect       INT IDENTITY (1,1) PRIMARY KEY,
    first_name              VARCHAR (15) NOT NULL ,
    second_name          VARCHAR (25) NOT NULL ,
    email             VARCHAR (35) NOT NULL UNIQUE,
    phone            INT ,
    employment_date DATE
  ) ;

CREATE TABLE material
  (
    id_material     INT IDENTITY (1,1) PRIMARY KEY,
    material_type VARCHAR (50) NOT NULL
  ) ;

ALTER TABLE sold_plans ADD CONSTRAINT sold_plans_client_FK FOREIGN KEY ( client_id_client ) REFERENCES client ( id_client ) ;

ALTER TABLE sold_plans ADD CONSTRAINT sold_plans_plan_FK FOREIGN KEY ( pplan_id_plan ) REFERENCES house_plan ( id_plan ) ;

ALTER TABLE house_plan ADD CONSTRAINT architect_FK FOREIGN KEY ( id_architect ) REFERENCES architect ( id_architect ) ;

ALTER TABLE house_plan ADD CONSTRAINT material_FK FOREIGN KEY ( id_material ) REFERENCES material ( id_material ) ;


INSERT INTO client VALUES ('Ala','Szaman',516654518,'aszaman@gmail.com');
INSERT INTO client VALUES ('Anna','Jurek',517658518,'ajurek@gmail.com');
INSERT INTO client VALUES ('Mirosaw','Kowalski',516654529,'mkowalski@wp.pl');
INSERT INTO client VALUES ('Kazimierz','Racawski',616654518,'kazio89@gmail.com');
INSERT INTO client VALUES ('Janina','Klimczuk',819654518,'klimczuk.janina@op.pl');
INSERT INTO client VALUES ('Józef','Giermusz',516652765,'josef_giermusz@gmail.com');
INSERT INTO client VALUES ('Katarzyna','Sejna',511654518,'ksejna@gmail.com');

INSERT INTO architect VALUES ('Jenusz','Gamos','jgamos@projekty.com.pl',516657876,'2001-05-03');
INSERT INTO architect VALUES ('Jeremi','Stoch','jstoch@projekty.com.pl',619657876,'2009-02-01');
INSERT INTO architect VALUES ('Amelia','Werno','awerno@projekty.com.pl',909657876,'2012-12-01');
INSERT INTO architect VALUES ('Weronika','Byrdy','wbyrdy@projekty.com.pl',519057876,'2010-08-04');
INSERT INTO architect VALUES ('Alojzy','Guæ','aguc@projekty.com.pl',506857876,'2011-06-02');

INSERT INTO material VALUES ('drewniany');
INSERT INTO material VALUES ('murowany');
INSERT INTO material VALUES ('drewniano-murowany');
INSERT INTO material VALUES ('szklano-murowany');
INSERT INTO material VALUES ('szkieletowy');

INSERT INTO house_plan VALUES ('Jaga',545000,2200,2,2);
INSERT INTO house_plan VALUES ('Zofia',350000,2000,1,1);
INSERT INTO house_plan VALUES ('Kacper',705000,3000,1,4);
INSERT INTO house_plan VALUES ('Wzgórza',300000,2500,3,2);
INSERT INTO house_plan VALUES ('Slonecznik',280000,2650,5,3);
INSERT INTO house_plan VALUES ('Maria',355000,3000,5,5);
INSERT INTO house_plan VALUES ('Wino',295000,2900,4,3);
INSERT INTO house_plan VALUES ('Kalejdoskop',386000,2600,1,2);
INSERT INTO house_plan VALUES ('Jawa',460000,3200,2,3);
INSERT INTO house_plan VALUES ('Wiera',560000,3500,3,4);
INSERT INTO house_plan VALUES ('Jolanta',290000,2500,2,1);
INSERT INTO house_plan VALUES ('Sara',540000,2300,4,5);

INSERT INTO sold_plans VALUES (8,1,8,1);
INSERT INTO sold_plans VALUES (10,2,10,2);
INSERT INTO sold_plans VALUES (8,3,8,3);
INSERT INTO sold_plans VALUES (1,4,1,4);
INSERT INTO sold_plans VALUES (2,5,2,5);
INSERT INTO sold_plans VALUES (3,6,3,6);
INSERT INTO sold_plans VALUES (5,7,5,7);
INSERT INTO sold_plans VALUES (8,7,8,7);
INSERT INTO sold_plans VALUES (5,1,5,1);




