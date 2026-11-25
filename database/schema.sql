-- ============================================================================
-- Esquema completo de la base de datos SH1_U1_DWP
-- ============================================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SH1_U1_DWP')
BEGIN
    CREATE DATABASE SH1_U1_DWP;
END
GO

USE SH1_U1_DWP;
GO

-- 1. Tabla de usuarios
CREATE TABLE usuarios (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nameuser NVARCHAR(50) NOT NULL,
    name NVARCHAR(50) NOT NULL,
    email NVARCHAR(60) NOT NULL,
    password NVARCHAR(60) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
GO

-- 2. Tabla de inventario de ropa
CREATE TABLE ropa (
    id INT IDENTITY(1,1) PRIMARY KEY,
    marca NVARCHAR(100) NOT NULL,
    modelo NVARCHAR(100) NOT NULL,
    talla NVARCHAR(20) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    descripcion NVARCHAR(255) NULL,
    imagen NVARCHAR(255) NULL
);
GO

-- 3. Tabla de mensajes del buzón
CREATE TABLE mensajes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    usuario_id VARCHAR(50) NOT NULL,
    asunto NVARCHAR(150) NOT NULL,
    mensaje NVARCHAR(500) NOT NULL,
    fecha DATETIME DEFAULT GETDATE()
);
GO

-- 4. Tabla de respuestas del buzón (depende de mensajes y usuarios)
CREATE TABLE respuestas (
    id INT PRIMARY KEY IDENTITY(1,1),
    mensaje_id INT NOT NULL,
    usuario_id INT NOT NULL,
    respuesta NVARCHAR(MAX) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (mensaje_id) REFERENCES mensajes(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
GO

-- 5. Tabla de tokens de recuperación de contraseña
CREATE TABLE tokens_recuperacion (
    id INT PRIMARY KEY IDENTITY(1,1),
    correo NVARCHAR(255) NOT NULL,
    token NVARCHAR(255) NOT NULL,
    expira DATETIME NOT NULL
);
GO

-- 6. Tabla de compras
CREATE TABLE compra (
    id VARCHAR(50) PRIMARY KEY,
    marca NVARCHAR(100) NOT NULL,
    modelo NVARCHAR(100) NOT NULL,
    talla NVARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    descripcion NVARCHAR(255),
    imagen NVARCHAR(255),
    usuario_id VARCHAR(50) NOT NULL,
    nombre_tarjeta NVARCHAR(150) NOT NULL,
    numero_tarjeta NVARCHAR(30) NOT NULL,
    fecha_exp NVARCHAR(10) NOT NULL,
    cvv NVARCHAR(5) NOT NULL,
    direccion NVARCHAR(255) NOT NULL,
    fecha_compra DATETIME DEFAULT GETDATE()
);
GO