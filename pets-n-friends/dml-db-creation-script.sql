CREATE TABLE `tipo_usuario` (
  `id` int PRIMARY KEY,
  `nombre` varchar(50)
);

CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `contraseña` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono_celular` varchar(15),
  `fecha_nacimiento` date,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `proveedores` (
  `id` int PRIMARY KEY,
  `nombre` varchar(50),
  `telefono` varchar(15),
  `correo` varchar(100)
);

CREATE TABLE `categoria_producto` (
  `id` int PRIMARY KEY,
  `nombre` varchar(50),
  `desc` text,
  `fecha_creacion` timestamp DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `inventario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `sku` varchar(8) NOT NULL,
  `UPC` bigint NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `fecha_reorden` date NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `promociones` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `porcentage_descuento` decimal(5,2) NOT NULL,
  `activo` boolean NOT NULL,
  `fecha_inicio` date,
  `fecha_fin` date,
  `fecha_creacion` timestamp DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `metodos_de_pago` (
  `id` int PRIMARY KEY,
  `nombre` varchar(50)
);

CREATE TABLE `wishlist` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50)
);

CREATE TABLE `detalles_de_pago` (
  `id` int PRIMARY KEY,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `metodo_pago_id` int NOT NULL,
  CONSTRAINT `fk_detalles_de_pago_metodos_de_pago` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodos_de_pago` (`id`)
);

CREATE TABLE `clientes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario_id` int,
  `wishlist_id` int,
  CONSTRAINT `fk_clientes_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_clientes_wishlist` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`)
);

CREATE TABLE `direccion_cliente` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `numero_casa` int,
  `calle` varchar(200),
  `corregimiento` varchar(50),
  `Distrito` varchar(50),
  `provincia` varchar(50),
  `tipo_recidencia` varchar(50),
  `descripcion` text,
  `cliente_id` int,
  CONSTRAINT `fk_direccion_cliente_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
);

CREATE TABLE `tarjeta_credito` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `numero` bigint NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_exp` date NOT NULL,
  `codigo_cvc` int NOT NULL,
  `proveedor` varchar(20),
  `cliente_id` int,
  CONSTRAINT `fk_tarjeta_credito_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
);

CREATE TABLE `carrito` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` int,
  `total` decimal(10,2),
  CONSTRAINT `fk_carrito_clientes` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
);

CREATE TABLE `productos` (
  `id` int PRIMARY KEY,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `proveedor_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  `inventario_id` int NOT NULL,
  `promociones_id` int,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_productos_proveedores` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`),
  CONSTRAINT `fk_productos_categoria_producto` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_producto` (`id`),
  CONSTRAINT `fk_productos_inventario` FOREIGN KEY (`inventario_id`) REFERENCES `inventario` (`id`),
  CONSTRAINT `fk_productos_promociones` FOREIGN KEY (`promociones_id`) REFERENCES `promociones` (`id`)
);

CREATE TABLE `orden` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `id_pago` int NOT NULL,
  `id_cliente` int NOT NULL,
  CONSTRAINT `fk_orden_detalles_de_pago` FOREIGN KEY (`id_pago`) REFERENCES `detalles_de_pago` (`id`),
  CONSTRAINT `fk_orden_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
);

CREATE TABLE `items_carrito` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `carrito_id` int,
  `producto_id` int,
  `cantidad` int,
  CONSTRAINT `fk_items_carrito_carrito` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`id`),
  CONSTRAINT `fk_items_carrito_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
);

CREATE TABLE `items_de_orden` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `producto_id` int,
  `cantidad` int NOT NULL,
  `order_id` int,
  CONSTRAINT `fk_items_de_orden_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_items_de_orden_orden` FOREIGN KEY (`order_id`) REFERENCES `orden` (`id`)
);

CREATE TABLE `items_wishlist` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `producto_id` int,
  `cantidad` int NOT NULL,
  `wishlist_id` int,
  CONSTRAINT `fk_items_wishlist_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_items_wishlist_wishlist` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`)
);