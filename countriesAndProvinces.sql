-- Create Country table
CREATE TABLE Country (
    CountryCode CHAR(2) PRIMARY KEY,
    CountryName VARCHAR(25) NOT NULL
);

-- Insert sample data into Country table
INSERT INTO Country (CountryCode, CountryName) VALUES
('CA', 'Canada'),
('RU', 'Russia'),
('JP', 'Japan'),
-- Add more countries as needed
;

-- Create Province table
CREATE TABLE Province (
    ProvinceCode CHAR(2) PRIMARY KEY,
    ProvinceName VARCHAR(25) NOT NULL,
    CountryCode CHAR(2),
    FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

-- Insert sample data into Province table
INSERT INTO Province (ProvinceCode, ProvinceName, CountryCode) VALUES
('BC', 'British Columbia', 'CA'),
('AB', 'Alberta', 'CA'),
('SK', 'Saskatchewan', 'CA'),
('BO', 'Belgorod Oblast', 'RU'),
('CO', 'Chukotka', 'RU'),
('DO', 'Hokkaido', 'JP'),
('TO', 'Tokyo', 'JP'),
-- Add more provinces as needed
;

-- Ensure that the CountryCode column in Province references an existing CountryCode
ALTER TABLE Province
ADD FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode);
