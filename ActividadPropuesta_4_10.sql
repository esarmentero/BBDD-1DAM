--El teléfono y el correo de los directores, vendedores y clientes son obligatorios y no se pueden compartir entre ellos. Es decir, son campos UNICOS.--
ALTER TABLE DIRECTOR ADD CONSTRAINT UK_TELEFONO_DIRECTOR UNIQUE (TELEFONO);
ALTER TABLE DIRECTOR ADD CONSTRAINT UK_EMAIL_DIRECTOR UNIQUE (EMAIL);
ALTER TABLE VENDEDOR ADD CONSTRAINT UK_TELEFONO_DIRECTOR UNIQUE (TELEFONO);
ALTER TABLE VENDEDOR ADD CONSTRAINT UK_EMAIL_DIRECTOR UNIQUE (EMAIL);
ALTER TABLE CLIENTE ADD CONSTRAINT UK_TELEFONO_DIRECTOR UNIQUE (TELEFONO);
ALTER TABLE CLIENTE ADD CONSTRAINT UK_EMAIL_DIRECTOR UNIQUE (EMAIL);

--El campo Telefono de las tablas Director, Vendedor y Cliente debe tener nueve dígitos.--
ALTER TABLE DIRECTOR ADD CONSTRAINT CK_TELEFONO_DIRECTOR CHECK (TELEFONO.LENTH>8 AND TELEFONO.LENTH<10);
ALTER TABLE VENDEDOR ADD CONSTRAINT CK_TELEFONO_VENDEDOR CHECK (TELEFONO.LENTH>8 AND TELEFONO.LENTH<10);
ALTER TABLE CLIENTE ADD CONSTRAINT CK_TELEFONO_CLIENTE CHECK (TELEFONO.LENTH>8 AND TELEFONO.LENTH<10);
ALTER TABLE CLIENTE ADD CONSTRAINT CK_TELEFONO_CLIENTE CHECK (TELEFONO.LENTH=9);

--En la tabla Venta el DNI del vendedor debe ser distinto al DNI del cliente.--
ALTER TABLE VENTA ADD CONSTRAINT CK_DNI_VENTA CHECK (DNIVEND != DNICL);

--En la tabla Producto la descripción es único y para las claves foráneas Familia y Genero se incluye la restricción de integridad referencial ON DELETE SET NULL.--
ALTER TABLE PRODUCTO ADD CONSTRAINT UK_DESCRIPCION_PRODUCTO UNIQUE (DESCRIPCION);

--En la tabla LineaVenta, el campo numLinea se limita al rango [1-99]--
ALTER TABLE LINEAVENTA ADD CONSTRAINT CK_NUMLINEA_LINEAVENTA CHECK (NUMLINEA>=1 AND NUMLINEA<=99);

