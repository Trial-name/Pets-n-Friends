DELIMITER //

CREATE PROCEDURE setCliente (
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_contraseña VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_telefono_celular VARCHAR(15)
)
BEGIN
    DECLARE cliente_id INT;
    DECLARE carrito_id INT;
    DECLARE wishlist_id INT;
    
    INSERT INTO clientes (nombre, apellido, contraseña, email, telefono_celular)
    VALUES (p_nombre, p_apellido, p_contraseña, p_email, p_telefono_celular);
    
    SET cliente_id = LAST_INSERT_ID();
    
    INSERT INTO wishlist (nombre)
    VALUES (CONCAT('Lista de deseos de ', p_nombre));
    
    SET wishlist_id = LAST_INSERT_ID();
    
    INSERT INTO carrito (cliente_id, total)
    VALUES (cliente_id, 0.00);
    
    SET carrito_id = LAST_INSERT_ID();
    
    UPDATE clientes
    SET wishlist_id = wishlist_id
    WHERE id = cliente_id;
END //

CREATE PROCEDURE getCliente (
    IN p_email VARCHAR(100),
    IN p_contraseña VARCHAR(100)
)
BEGIN
    SELECT id, nombre, apellido, email, telefono_celular, wishlist_id
    FROM clientes
    WHERE email = p_email AND contraseña = p_contraseña;
END //
CREATE PROCEDURE getProduct(IN productId INT)
BEGIN
    SELECT
        id,
        nombre AS nombre_producto,
        descripcion,
        precio,
        (SELECT nombre FROM categoria_producto WHERE id = categoria_id) AS categoria,
        (SELECT cantidad FROM inventario WHERE id = inventario_id) AS cantidad_inventario,
        image_url
    FROM
        productos
    WHERE
        id = productId;
END //

CREATE PROCEDURE getProductsByCategory(IN categoryName VARCHAR(50))
BEGIN
    SELECT
        p.id,
        p.nombre AS nombre_producto,
        p.descripcion,
        p.precio,
        (SELECT nombre FROM categoria_producto WHERE id = p.categoria_id) AS categoria,
        (SELECT cantidad FROM inventario WHERE id = p.inventario_id) AS cantidad_inventario,
        p.image_url
    FROM
        productos p
    JOIN
        categoria_producto c ON p.categoria_id = c.id
    WHERE
        c.nombre = categoryName;
END //

CREATE PROCEDURE getAllProductsInfo()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE productId INT;
    DECLARE cur CURSOR FOR SELECT id FROM productos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO productId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL getProduct(productId);
    END LOOP;
    
    CLOSE cur;
END //

CREATE PROCEDURE createProductTable()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE productId INT;
    DECLARE cur CURSOR FOR SELECT id FROM productos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Drop table if exists to ensure clean creation
    DROP TABLE IF EXISTS product_info;
    
    -- Create a new table to store product information
    CREATE TABLE product_info (
        id INT PRIMARY KEY,
        nombre_producto VARCHAR(50),
        descripcion TEXT,
        precio DECIMAL(10,2),
        categoria VARCHAR(50),
        cantidad_inventario INT,
        image_url VARCHAR(255)
    );
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO productId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert product information into the product_info table
        INSERT INTO product_info
        SELECT
            id,
            nombre AS nombre_producto,
            descripcion,
            precio,
            (SELECT nombre FROM categoria_producto WHERE id = categoria_id) AS categoria,
            (SELECT cantidad FROM inventario WHERE id = inventario_id) AS cantidad_inventario,
            image_url
        FROM
            productos
        WHERE
            id = productId;
    END LOOP;
    
    CLOSE cur;
END //

call createProductTable;

CREATE PROCEDURE createProductTableByCategory(IN categoryId INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE productId INT;
    DECLARE cur CURSOR FOR SELECT id FROM productos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Drop table if exists to ensure clean creation
    DROP TABLE IF EXISTS product_info_by_category;
    
    -- Create a new table to store product information by category
    CREATE TABLE product_info_by_category (
        id INT PRIMARY KEY,
        nombre_producto VARCHAR(50),
        descripcion TEXT,
        precio DECIMAL(10,2),
        categoria VARCHAR(50),
        cantidad_inventario INT,
        image_url VARCHAR(255)
    );
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO productId;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Insert product information into the product_info_by_category table
        INSERT INTO product_info_by_category
        SELECT
            id,
            nombre AS nombre_producto,
            descripcion,
            precio,
            (SELECT nombre FROM categoria_producto WHERE id = categoria_id) AS categoria,
            (SELECT cantidad FROM inventario WHERE id = inventario_id) AS cantidad_inventario,
            image_url
        FROM
            productos
        WHERE
            categoria_id = categoryId
            AND id = productId;
    END LOOP;
    
    CLOSE cur;
END //

CREATE PROCEDURE getFirstFourProducts()
BEGIN
    -- Drop table if exists to ensure clean creation
    DROP TABLE IF EXISTS first_four_products;
    
    -- Create a new table to store first four product information
    CREATE TABLE first_four_products (
        id INT PRIMARY KEY,
        nombre_producto VARCHAR(50),
        descripcion TEXT,
        precio DECIMAL(10,2),
        categoria VARCHAR(50),
        cantidad_inventario INT,
        image_url VARCHAR(255)
    );
    
    -- Insert first four product information into the first_four_products table
    INSERT INTO first_four_products
    SELECT
        id,
        nombre AS nombre_producto,
        descripcion,
        precio,
        (SELECT nombre FROM categoria_producto WHERE id = categoria_id) AS categoria,
        (SELECT cantidad FROM inventario WHERE id = inventario_id) AS cantidad_inventario,
        image_url
    FROM
        productos
    LIMIT 4;
END //
call getFirstFourProducts;
DELIMITER ;
