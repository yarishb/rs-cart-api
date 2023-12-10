-- Create type for cart status
CREATE TYPE cart_status AS ENUM ('OPEN', 'ORDERED');

-- Create carts table
CREATE TABLE carts (
    id UUID PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    status cart_status NOT NULL
);

-- Create cart_items table
CREATE TABLE cart_items (
    id UUID PRIMARY KEY NOT NULL,
    cart_id UUID REFERENCES carts(id),
    product_id UUID,
    count INTEGER
);

-- Insert data into carts table
INSERT INTO carts (id, user_id, created_at, updated_at, status) VALUES
    (gen_random_uuid(), gen_random_uuid(), '2023-12-10', '2023-12-10', 'ORDERED'),
    (gen_random_uuid(), gen_random_uuid(), '2023-12-10', '2023-12-10', 'ORDERED'),
    (gen_random_uuid(), gen_random_uuid(), '2023-12-10', '2023-12-10', 'OPEN'),
    (gen_random_uuid(), gen_random_uuid(), '2023-12-10', '2023-12-10', 'OPEN');

-- Insert data into cart_items table
INSERT INTO cart_items (id, cart_id, product_id, count) VALUES
    (gen_random_uuid(), 'd4a5ce44-825a-11ee-b962-0242ac120003', gen_random_uuid(), 3),
    (gen_random_uuid(), 'e3e780b4-825a-11ee-b962-0242ac120003', gen_random_uuid(), 7),
    (gen_random_uuid(), 'e904a8a6-825a-11ee-b962-0242ac120003', gen_random_uuid(), 2),
    (gen_random_uuid(), 'f821b86a-825a-11ee-b962-0242ac120003', gen_random_uuid(), 15);
