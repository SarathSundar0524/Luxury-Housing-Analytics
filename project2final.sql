SELECT * FROM luxury_housing_blr;

SELECT * FROM luxury_housing_blr LIMIT 10;

SELECT COUNT(*) FROM luxury_housing_blr;

MARKET TRENDS
SELECT 
    "Purchase_Quarter",
    "Micro_Market",
    COUNT(*) AS total_properties,
    SUM("Booking_Flag") AS total_bookings
FROM luxury_housing_blr
GROUP BY "Purchase_Quarter", "Micro_Market"
ORDER BY "Purchase_Quarter", "Micro_Market";

Total Revenue per Builder
SELECT 
    "Developer_Name",
    SUM("Ticket_Price_Cr") AS total_revenue
FROM luxury_housing_blr
GROUP BY "Developer_Name"
ORDER BY total_revenue DESC;

Average Ticket Price per Builder
SELECT 
    "Developer_Name" AS builder,
    AVG("Ticket_Price_Cr") AS avg_ticket_price
FROM luxury_housing_blr
GROUP BY "Developer_Name"
ORDER BY avg_ticket_price DESC;

Amenity Impact
SELECT
    "Amenity_Score",
    COUNT(*) AS total_projects,
    SUM("Booking_Flag") AS booked_projects,
    ROUND(SUM("Booking_Flag")::decimal / COUNT(*) * 100, 2) AS conversion_rate
FROM luxury_housing_blr
GROUP BY "Amenity_Score"
ORDER BY "Amenity_Score";

SELECT
    "Amenity_Bucket",
    COUNT(*) AS total,
    SUM("Booking_Flag") AS booked,
    ROUND(SUM("Booking_Flag")::decimal / COUNT(*) * 100, 2) AS conversion_rate
FROM luxury_housing_blr
GROUP BY "Amenity_Bucket";


Amenity Bucket x Micro Market Analysis
SELECT
    "Micro_Market",
    "Amenity_Bucket",
    COUNT(*) AS total,
    SUM("Booking_Flag") AS booked,
    ROUND(SUM("Booking_Flag")::decimal / COUNT(*) * 100, 2) AS conversion_rate
FROM luxury_housing_blr
GROUP BY "Micro_Market", "Amenity_Bucket"
ORDER BY "Micro_Market", "Amenity_Bucket";

Checkfornull
SELECT 
    SUM(CASE WHEN "Ticket_Price_Cr" IS NULL THEN 1 END) AS null_ticket_price,
    SUM(CASE WHEN "Unit_Size_Sqft" IS NULL THEN 1 END) AS null_unit_size,
    SUM(CASE WHEN "Amenity_Score" IS NULL THEN 1 END) AS null_amenity
FROM luxury_housing_blr;

distinctbuilders
SELECT DISTINCT "Developer_Name"
FROM luxury_housing_blr
ORDER BY "Developer_Name";

Buyer Sentiment
SELECT
    "Comment_Sentiment",
    COUNT(*) AS total_comments,
    SUM("Booking_Flag") AS bookings
FROM luxury_housing_blr
GROUP BY "Comment_Sentiment"
ORDER BY total_comments DESC;

Booking Conversion by Micro Market
SELECT
    "Micro_Market",
    COUNT(*) AS total_projects,
    SUM("Booking_Flag") AS booked,
    ROUND(SUM("Booking_Flag")::decimal / COUNT(*) * 100, 2) AS conversion_rate
FROM luxury_housing_blr
GROUP BY "Micro_Market"
ORDER BY conversion_rate DESC;

