INSERT INTO metodos_de_pago (id, nombre) VALUES
(1, 'Tarjeta de Crédito'),
(2, 'PayPal'),
(3, 'Transferencia Bancaria');

INSERT INTO proveedores (id, nombre, telefono, correo) VALUES
(1, 'Proveedor Alimentos', '+507-123-4567', 'alimentos@proveedor.com'),
(2, 'Proveedor Juguetes', '+507-234-5678', 'juguetes@proveedor.com'),
(3, 'Proveedor Accesorios', '+507-345-6789', 'accesorios@proveedor.com');

INSERT INTO categoria_producto (id, nombre, descripcion, fecha_creacion, fecha_modificacion) VALUES
(1, 'Alimentos', 'Productos alimenticios para mascotas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Juguetes', 'Juguetes divertidos para mascotas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'Accesorios', 'Accesorios variados para mascotas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO inventario (id, sku, UPC, cantidad, costo_unitario, fecha_reorden, fecha_creacion, fecha_modificacion) VALUES
(1, 'SKU001', 1234567890123, 100, 10.50, '2024-07-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'SKU002', 2345678901234, 50, 5.75, '2024-07-05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'SKU003', 3456789012345, 75, 8.25, '2024-07-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'SKU004', 4567890123456, 80, 7.50, '2024-07-02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(5, 'SKU005', 5678901234567, 60, 4.99, '2024-07-06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(6, 'SKU006', 6789012345678, 45, 6.25, '2024-07-12', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(7, 'SKU007', 7890123456789, 90, 12.30, '2024-07-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(8, 'SKU008', 8901234567890, 55, 9.99, '2024-07-20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(9, 'SKU009', 9012345678901, 40, 3.75, '2024-07-25', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(10, 'SKU010', 1234567890124, 70, 11.50, '2024-07-30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(11, 'SKU011', 2345678901235, 85, 8.75, '2024-08-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(12, 'SKU012', 3456789012346, 65, 7.99, '2024-08-05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(13, 'SKU013', 4567890123457, 50, 6.99, '2024-08-10', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(14, 'SKU014', 5678901234568, 95, 5.50, '2024-08-15', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(15, 'SKU015', 6789012345679, 80, 4.75, '2024-08-20', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(16, 'SKU016', 7890123456780, 60, 3.99, '2024-08-25', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(17, 'SKU017', 8901234567891, 70, 8.99, '2024-08-30', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(18, 'SKU018', 9012345678902, 100, 12.50, '2024-09-01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO productos (id, nombre, descripcion, precio, proveedor_id, categoria_id, inventario_id, promociones_id, fecha_creacion, fecha_modificacion, image_url) VALUES
-- Alimentos (categoria_id = 1)
(1, 'Croquetas Premium', 'Croquetas nutritivas para perros', 15.99, 1, 1, 1, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(2, 'Comida Húmeda', 'Comida húmeda para gatos', 12.75, 1, 1, 2, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(3, 'Snack Dental', 'Snack para limpieza dental de perros', 8.50, 1, 1, 3, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(4, 'Comida para Peces', 'Alimento completo para peces', 9.50, 1, 1, 4, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(5, 'Golosinas para Perros', 'Golosinas de alta calidad para perros', 6.99, 1, 1, 5, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(6, 'Comida para Aves', 'Alimento balanceado para aves', 10.99, 1, 1, 6, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),

-- Juguetes (categoria_id = 2)
(7, 'Pelota de Cuerda', 'Pelota resistente para perros', 6.99, 2, 2, 7, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(8, 'Ratón de Juguete', 'Ratón de juguete para gatos', 4.50, 2, 2, 8, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(9, 'Pelota con Sonido', 'Pelota con sonido para perros', 5.99, 2, 2, 9, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(10, 'Juguete de Plumas', 'Juguete de plumas para gatos', 7.50, 2, 2, 10, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(11, 'Juguete de Masticar', 'Juguete de masticar para perros', 9.99, 2, 2, 11, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(12, 'Juguete Interactivo', 'Juguete interactivo para mascotas', 8.99, 2, 2, 12, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),

-- Accesorios (categoria_id = 3)
(13, 'Collar Reflectante', 'Collar reflectante para perros', 12.99, 3, 3, 13, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(14, 'Correa Extensible', 'Correa extensible para perros', 15.50, 3, 3, 14, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(15, 'Placa Identificativa', 'Placa identificativa para mascotas', 6.99, 3, 3, 15, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(16, 'Cama para Mascotas', 'Cama cómoda para mascotas', 19.99, 3, 3, 16, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(17, 'Transportadora', 'Transportadora para mascotas', 24.99, 3, 3, 17, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless'),
(18, 'Abrigo para Perros', 'Abrigo cálido para perros', 29.99, 3, 3, 18, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'https://media.discordapp.net/attachments/716089210532265994/1258464552811757659/Placeholder-_-Glossary.png?ex=668823f2&is=6686d272&hm=489063b9ec34a568652693612d6d8c276af603337fe4cdb19b2e3a5af7e05123&=&format=webp&quality=lossless');

-- cliente
CALL setCliente('Juan', 'Perez', 'password123', 'juan@example.com', '555-1234');