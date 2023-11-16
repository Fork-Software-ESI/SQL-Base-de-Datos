/*CONSULTA CON 4 JOIN QUE MUESTRA LA INFORMACIÓN DE LOS PAQUETES QUE ESTÁN EN UN ESTANTE, CON LA INFORMACIÓN DEL PAQUETE, DEL ESTANTE, 
EL ALMACEN DE ESE ESTANTE Y EL GERENTE QUE LO REGISTRÓ*/
SELECT
  p.ID AS 'ID_Paquete',
  p.Descripcion AS 'Descripcion_Paquete',
  e.ID AS 'ID_Estante',
  e.ID_Almacen AS 'ID_Almacen',
  a.Direccion AS 'Direccion_Almacen',
  ga.ID_Gerente AS 'ID_Gerente_Almacen',
  pa.Nombre AS 'Nombre_Gerente_Almacen',
  pa.Apellido AS 'Apellido_Gerente_Almacen'
FROM
  paquete AS p
  JOIN paquete_estante AS pe ON p.ID = pe.ID_Paquete
  JOIN estante AS e ON pe.ID_Estante = e.ID
  JOIN almacen AS a ON e.ID_Almacen = a.ID
  LEFT JOIN gerente_almacen AS ga ON a.ID = ga.ID_Almacen
  LEFT JOIN persona AS pa ON ga.ID_Gerente = pa.ID;
  

  /* CONSULTA NOMBRE Y APELLIDO DEL CHOFER QUE MANEJA EL CAMION QUE TRANSPORTA EL LOTE 2*/
  π Nombre, Apellido (σ ID_Lote = 2 (Chofer ⨝ (ρ ID_Camion/ID_Camion_lleva_lote, ID_Lote/ID_Lote) (Camion ⨝ camion_lleva_lote))));

  /* Consultas tercer entrega*/
  
  
  /* Vista*/
CREATE VIEW Cliente_Info AS
SELECT P.ID AS Persona_ID, P.CI, P.Nombre, P.Apellido, P.Correo, 'Cliente' AS Tipo
FROM Persona P
JOIN Cliente C ON P.ID = C.ID;
 
 
 /* join entre 4 tablas*/
 SELECT 
    P.ID AS Persona_ID,
    P.CI,
    P.Nombre,
    P.Apellido,
    P.Correo,
    CASE 
        WHEN C.ID IS NOT NULL THEN 'Cliente'
        WHEN Ch.ID IS NOT NULL THEN 'Chofer'
        ELSE 'N/A'
    END AS Tipo,
    TL.Tipo AS Tipo_Libreta
FROM Persona P
LEFT JOIN Cliente C ON P.ID = C.ID
LEFT JOIN Chofer Ch ON P.ID = Ch.ID
LEFT JOIN Chofer_Tipo_Libreta CTL ON Ch.ID = CTL.ID
LEFT JOIN Tipo_Libreta TL ON CTL.Tipo = TL.Tipo;
