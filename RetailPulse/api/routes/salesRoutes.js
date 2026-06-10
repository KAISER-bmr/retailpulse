const express = require('express');
const router  = express.Router();
const db      = require('../db');

// 1. Total Revenue
router.get('/total-revenue', async (req, res) => {
    try {
        const result = await db.one(`
            SELECT ROUND(SUM(oi.quantity * oi.price_at_purchase)::numeric, 2)
            AS total_revenue
            FROM Order_Items oi
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 2. Total Orders
router.get('/total-orders', async (req, res) => {
    try {
        const result = await db.one(`
            SELECT COUNT(*) AS total_orders FROM Orders
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 3. Revenue by Region
router.get('/revenue-by-region', async (req, res) => {
    try {
        const result = await db.any(`
            SELECT
                r.region_name,
                r.country,
                ROUND(SUM(oi.quantity * oi.price_at_purchase)::numeric, 2)
                AS total_revenue
            FROM Orders o
            JOIN Regions r      ON o.region_id    = r.region_id
            JOIN Order_Items oi ON o.order_id     = oi.order_id
            GROUP BY r.region_name, r.country
            ORDER BY total_revenue DESC
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 4. Revenue by Category
router.get('/revenue-by-category', async (req, res) => {
    try {
        const result = await db.any(`
            SELECT
                c.category_name,
                ROUND(SUM(oi.quantity * oi.price_at_purchase)::numeric, 2)
                AS total_revenue
            FROM Order_Items oi
            JOIN Products p    ON oi.product_id  = p.product_id
            JOIN Categories c  ON p.category_id  = c.category_id
            GROUP BY c.category_name
            ORDER BY total_revenue DESC
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 5. Top 5 Products by Revenue
router.get('/top-products', async (req, res) => {
    try {
        const result = await db.any(`
            SELECT
                p.product_name,
                SUM(oi.quantity) AS total_quantity,
                ROUND(SUM(oi.quantity * oi.price_at_purchase)::numeric, 2)
                AS total_revenue
            FROM Order_Items oi
            JOIN Products p ON oi.product_id = p.product_id
            GROUP BY p.product_name
            ORDER BY total_revenue DESC
            LIMIT 5
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 6. Monthly Sales Trend
router.get('/monthly-sales', async (req, res) => {
    try {
        const result = await db.any(`
            SELECT
                TO_CHAR(o.order_date, 'YYYY-MM') AS month,
                ROUND(SUM(oi.quantity * oi.price_at_purchase)::numeric, 2)
                AS monthly_revenue
            FROM Orders o
            JOIN Order_Items oi ON o.order_id = oi.order_id
            GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
            ORDER BY month ASC
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 7. Average Order Value
router.get('/avg-order-value', async (req, res) => {
    try {
        const result = await db.one(`
            SELECT
                ROUND(AVG(order_total)::numeric, 2) AS avg_order_value
            FROM (
                SELECT
                    order_id,
                    SUM(quantity * price_at_purchase) AS order_total
                FROM Order_Items
                GROUP BY order_id
            ) AS order_totals
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 8. Total Customers
router.get('/total-customers', async (req, res) => {
    try {
        const result = await db.one(`
            SELECT COUNT(*) AS total_customers FROM Customers
        `);
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

module.exports = router;