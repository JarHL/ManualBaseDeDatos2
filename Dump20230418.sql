-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: tiendaonline
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detallepedidos`
--

DROP TABLE IF EXISTS `detallepedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepedidos` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `Precio_total` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`idPedido`,`idProducto`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `detallepedidos_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`numero_pedido`),
  CONSTRAINT `detallepedidos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedidos`
--

LOCK TABLES `detallepedidos` WRITE;
/*!40000 ALTER TABLE `detallepedidos` DISABLE KEYS */;
INSERT INTO `detallepedidos` VALUES (10001,21,2,1999.99,3999.98),(10002,20,1,4999.99,4999.99),(10003,9,4,15000.00,60000.00),(10004,8,3,4000.00,12000.00),(10005,15,1,23999.99,23999.99),(10006,23,2,2999.99,5999.98),(10007,21,3,1999.99,5999.97),(10008,14,2,15999.99,31999.98),(10009,2,1,8000.00,8000.00),(10010,18,3,5999.99,17999.97),(10011,10,1,3000.00,3000.00),(10012,19,2,18999.99,37999.98),(10013,14,4,15999.99,63999.96);
/*!40000 ALTER TABLE `detallepedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `numero_pedido` int(11) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `estado_pedido` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalles_envio` varchar(100) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (10001,'2022-01-02','Enviado',2,'Av. Insurgentes Sur #123, Ciudad de México',21),(10002,'2022-01-04','Entregado',1,'Av. Constitución #456, Guadalajara',20),(10003,'2022-01-05','En proceso',4,'Calle Juárez #789, Monterrey',9),(10004,'2022-01-06','Entregado',3,'Av. Revolución #234, Ciudad de México',8),(10005,'2022-01-10','Enviado',1,'Av. Paseo de la Reforma #567, Ciudad de México',15),(10006,'2022-01-11','En proceso',2,'Calle Hidalgo #890, Guadalajara',23),(10007,'2022-01-13','Entregado',3,'Av. Morelos #123, Ciudad de México',21),(10008,'2022-01-15','Enviado',2,'Calle Victoria #456, Monterrey',14),(10009,'2022-01-18','En proceso',1,'Av. Miguel Hidalgo #789, Guadalajara',2),(10010,'2022-01-20','Entregado',3,'Calle 16 de Septiembre #234, Monterrey',18),(10011,'2022-01-22','Enviado',1,'Av. Chapultepec #567, Ciudad de México',10),(10012,'2022-01-24','En proceso',2,'Calle Zaragoza #890, Guadalajara',19),(10013,'2022-01-25','Entregado',4,'Av. López Mateos #123, Ciudad de México',14);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop Dell Inspiron','Laptop de 15 pulgadas, procesador Intel Core i5, 8 GB de RAM y 512 GB de almacenamiento SSD',20000.00,10,'Laptop'),(2,'Smartphone Samsung Galaxy A50','Smartphone con pantalla de 6.4 pulgadas, procesador Octa-Core, 4 GB de RAM y 128 GB de almacenamiento interno',8000.00,25,'Smartphone'),(3,'Tablet Huawei MatePad Pro','Tablet con pantalla de 10.8 pulgadas, procesador Kirin 990, 6 GB de RAM y 128 GB de almacenamiento interno',12000.00,8,'Tablet'),(4,'Monitor LG 24MK400H-B','Monitor de 24 pulgadas, resolución Full HD, tiempo de respuesta de 2ms',3000.00,15,'Monitor'),(5,'Mouse Logitech G502','Mouse para gaming con 11 botones programables, sensor óptico de alta precisión y 16.000 DPI',1500.00,30,'Accesorios'),(6,'Teclado Mecánico HyperX Alloy FPS Pro','Teclado mecánico con interruptores Cherry MX Red, iluminación LED roja y anti-ghosting para todas las teclas',2000.00,20,'Accesorios'),(7,'Impresora HP DeskJet 2723','Impresora multifuncional de inyección de tinta, impresión a doble cara y conectividad WiFi',2500.00,12,'Impresoras'),(8,'Bocina Sony GTK-PG10','Bocina portátil con batería recargable, resistente al agua y con conectividad Bluetooth',4000.00,5,'Audio'),(9,'Cámara Canon EOS M50','Cámara sin espejo con sensor CMOS de 24.1 megapíxeles, grabación de video 4K y pantalla táctil de ángulo variable',15000.00,3,'Cámaras'),(10,'Disco Duro Externo Seagate Expansion','Disco duro externo con capacidad de 2 TB, conexión USB 3.0 y velocidad de transferencia de hasta 120 MB/s',3000.00,18,'Almacenamiento'),(11,'Smart TV Samsung 50TU8000','Smart TV de 50 pulgadas, resolución 4K UHD, HDR y conexión WiFi',10000.00,6,'Televisores'),(12,'Batería Externa Anker PowerCore','Batería externa de 10000 mAh, carga rápida y diseño compacto',800.00,35,'Accesorios'),(13,'Laptop Dell Inspiron 14','Laptop de 14 pulgadas con procesador Intel Core i5 y memoria RAM de 8GB',13999.99,10,'Laptop'),(14,'Smartphone Samsung Galaxy S20','Smartphone de gama alta con pantalla AMOLED de 6.2 pulgadas y cámara trasera de 64MP',15999.99,5,'Smartphone'),(15,'Tablet Apple iPad Pro','Tablet con pantalla retina de 11 pulgadas y procesador A12Z Bionic',23999.99,8,'Tablet'),(16,'Smartwatch Apple Watch Series 6','Smartwatch con pantalla retina siempre activa y sensor de oxígeno en la sangre',8499.99,15,'Wearables'),(17,'Laptop HP Pavilion 15','Laptop de 15.6 pulgadas con procesador AMD Ryzen 5 y memoria RAM de 16GB',11999.99,12,'Laptop'),(18,'Smartphone Xiaomi Redmi Note 10 Pro','Smartphone con pantalla AMOLED de 6.67 pulgadas y cámara trasera de 108MP',5999.99,20,'Smartphone'),(19,'Tablet Samsung Galaxy Tab S7','Tablet con pantalla AMOLED de 11 pulgadas y procesador Qualcomm Snapdragon 865+',18999.99,6,'Tablet'),(20,'Smartwatch Fitbit Versa 3','Smartwatch con pantalla AMOLED y función de seguimiento de la salud',4999.99,18,'Wearables'),(21,'Impresora HP Deskjet 2720','Impresora multifuncional con conexión Wi-Fi',1999.99,7,'Impresoras'),(22,'Monitor LG 27UK850-W','Monitor de 27 pulgadas con resolución 4K y conexión USB-C',10999.99,3,'Monitores'),(23,'Disco duro externo Seagate Backup Plus Slim','Disco duro externo de 2TB con conexión USB 3.0',2999.99,9,'Almacenamiento'),(24,'Audífonos inalámbricos Bose QuietComfort Earbuds','Audífonos inalámbricos con cancelación de ruido y micrófono integrado',7999.99,13,'Audífonos'),(25,'Teclado y mouse inalámbricos Logitech MK345','Kit de teclado y mouse inalámbricos con conexión USB',1599.99,11,'Accesorios');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  `rol` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','juan.perez@mail.com','123456','2022-01-01','cliente'),(2,'María','García','maria.garcia@mail.com','abcdef','2022-01-02','cliente'),(3,'Pedro','Rodríguez','pedro.rodriguez@mail.com','qwerty','2022-01-03','cliente'),(4,'Luisa','Martínez','luisa.martinez@mail.com','zxcvbn','2022-01-04','cliente'),(5,'Ana','Sánchez','ana.sanchez@mail.com','ytrewq','2022-01-05','cliente'),(6,'Pablo','González','pablo.gonzalez@mail.com','098765','2022-01-06','administrador'),(7,'Sofía','Hernández','sofia.hernandez@mail.com','456789','2022-01-07','administrador'),(8,'David','Jiménez','david.jimenez@mail.com','asdfgh','2022-01-08','administrador'),(9,'Carla','López','carla.lopez@mail.com','poiuyt','2022-01-09','administrador'),(10,'Lorenzo','Gómez','lorenzo.gomez@mail.com','mnbvcx','2022-01-10','administrador'),(11,'Lucía','Fernández','lucia.fernandez@mail.com','1qaz2wsx','2022-01-11','cliente'),(12,'Javier','Álvarez','javier.alvarez@mail.com','3edc4rfv','2022-01-12','cliente'),(13,'Adriana','Torres','adriana.torres@mail.com','5tgb6yhn','2022-01-13','cliente'),(14,'Roberto','Díaz','roberto.diaz@mail.com','7ujm8ikl','2022-01-14','cliente'),(15,'Elena','Ruiz','elena.ruiz@mail.com','9olp0ñlk','2022-01-15','cliente');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tiendaonline'
--

--
-- Dumping routines for database 'tiendaonline'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18  0:26:04
