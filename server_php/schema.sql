-- PupilMetrics License Server — Database Schema
-- Run this once in cPanel → phpMyAdmin → your database → SQL tab

CREATE TABLE IF NOT EXISTS licenses (
    id              INT          NOT NULL AUTO_INCREMENT,
    license_key     VARCHAR(50)  NOT NULL,
    type            VARCHAR(20)  NOT NULL,
    email           VARCHAR(255) NOT NULL,
    registered_to   VARCHAR(255) NOT NULL,
    issued_at       DATETIME     NOT NULL,
    expires_at      DATETIME     NULL,
    revoked         TINYINT(1)   NOT NULL DEFAULT 0,
    revoked_at      DATETIME     NULL,
    revoked_reason  VARCHAR(500) NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uq_license_key (license_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS activations (
    id           INT          NOT NULL AUTO_INCREMENT,
    license_key  VARCHAR(50)  NOT NULL,
    machine_id   VARCHAR(100) NOT NULL,
    activated_at DATETIME     NOT NULL,
    platform     VARCHAR(50)  NOT NULL DEFAULT 'unknown',
    app_version  VARCHAR(20)  NOT NULL DEFAULT 'unknown',
    PRIMARY KEY (id),
    UNIQUE KEY uq_activation (license_key, machine_id),
    FOREIGN KEY (license_key) REFERENCES licenses(license_key) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
