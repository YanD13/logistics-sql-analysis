-- ============================================
-- Project: Logistics Data Analysis
-- Author: Yan Daniliuk
-- Tool: SQL
-- ============================================

-- Goal:
-- Analyze shipment data to identify patterns in routes,
-- countries, transport types, and delivery performance.

-- 1. Total shipments
SELECT COUNT(*) AS total_shipments
FROM shipments;

-- 2. Total and average weight
SELECT
    SUM(weight_kg) AS total_weight,
    AVG(weight_kg) AS avg_weight
FROM shipments;

-- 3. Shipments by delivery status
SELECT
    delivery_status,
    COUNT(*) AS shipments_count
FROM shipments
GROUP BY delivery_status
ORDER BY shipments_count DESC;

-- 4. Shipments by transport type
SELECT
    transport_type,
    COUNT(*) AS shipments_count
FROM shipments
GROUP BY transport_type
ORDER BY shipments_count DESC;

-- 5. Top origin countries
SELECT
    origin_country,
    COUNT(*) AS shipments_count
FROM shipments
GROUP BY origin_country
ORDER BY shipments_count DESC
LIMIT 10;

-- 6. Top destination countries
SELECT
    destination_country,
    COUNT(*) AS shipments_count
FROM shipments
GROUP BY destination_country
ORDER BY shipments_count DESC
LIMIT 10;

-- 7. Delivery zones
SELECT
    delivery_zone,
    COUNT(*) AS shipments_count
FROM shipments
GROUP BY delivery_zone
ORDER BY shipments_count DESC;

-- 8. Longest routes
SELECT
    origin_country,
    origin_city,
    destination_country,
    destination_city,
    distance_km
FROM routes
ORDER BY distance_km DESC
LIMIT 10;

-- 9. Average distance by transport type
SELECT
    transport_type,
    AVG(distance_km) AS avg_distance
FROM routes
GROUP BY transport_type
ORDER BY avg_distance DESC;

-- ============================================
-- Key Insights:
-- - Road transport dominates logistics operations
-- - Germany and Italy are key logistics hubs
-- - Western Europe has the highest shipment volume
-- - Long-distance routes are mostly international
-- ============================================
