ALTER TABLE DatosPersonales ADD  CONSTRAINT ck_tipo CHECHK (TIPO = 'N' OR TIPO = 'D');

ALTER TABLE Departamento ADD CONSTRAINT ck_numProf CHECK (numProf BETWEEN 1 AND 30);
ALTER TABLE Departamento ADD CONSTRAINT uk_Descripcion UNIQUE (Descripcion);

ALTER TABLE Doctorando ADD CONSTRAINT ck_fechaComienzo CHECK (fechaComienzo >= TO_DATE('01/01/2000') AND fechaComienzo <= SYSDATE);

ALTER TABLE Doctor ADD CONSTRAINT uk_titulo UNIQUE (titulo); 
ALTER TABLE Doctor ADD CONSTRAINT ck_titulo_length CHECK (LENGTH(titulo) >= 10); 
ALTER TABLE Doctor ADD CONSTRAINT ck_calificacion CHECK (calificacion BETWEEN 0 AND 10);

ALTER TABLE Curso ADD CONSTRAINT ck_duracion CHECK (duracion BETWEEN 10 AND 500);
