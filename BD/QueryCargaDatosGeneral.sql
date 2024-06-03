 insert into Marcas (Descripcion) values
 ('AMD'),
 ('Asrock'),
 ('Corsair'),
 ('XFX');

 insert into Categorias (Descripcion) values
 ('Procesadores'),
 ('Motherboards'),
 ('Memorias RAM'),
 ('Placa de Videos'),
 ('Almacenamiento'),
 ('Fuentes'),
 ('Gabinetes'),
 ('Monitores'),
 ('Perifericos(mouse/teclado/parlantes/mousepad)');

 insert into Tipos_Imagenes (Tipo) values
 ('Producto');

 insert into Productos (ID_Categoria,ID_Marca,Nombre,Descripcion,Precio,stock) values
 (1,1,'Procesador AMD RYZEN 5 3600 4.2GHz Turbo AM4 Wraith Stealth Cooler','lindo Procesador',1300,10),
 (2,2,'Mother Asrock B450M-HDV 4.0 AM4 HDMI M.2','lindo placa, anda bien ',78800,5),
 (3,3,'Memoria Corsair DDR4 8GB 3200Mhz Vengeance LPX Black CL16','Muy rapida',29150,2),
 (4,4,'Placa de Video XFX Radeon RX 580 8GB GDDR5 GTS 2048SP','Buena relacion calidad-precio',179240,1)
 insert into Imagen (UrlImagen,ID_Producto,Tipo_Imagen) values
 ('https://innovatech.ar/wp-content/uploads/2021/08/11-2.jpg',1,1),
 ('https://asrock.com/mb/photo/B450M-HDV(L1).png',2,1),
 ('https://fullh4rd.com.ar/img/productos/4/memoria-16gb-2x8gb-ddr4-3200-corsair-vengeance-lpx-black-0.jpg',3,1),
 ('https://m.media-amazon.com/images/I/61EvAMKJQ6L._AC_SX679_.jpg',4,1);