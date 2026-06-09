# RetailPulse — Sales Performance Dashboard

> End-to-end sales analytics solution built as the 
> capstone project for the EduSkills SQL & Database 
> Management Systems Virtual Internship.

## Overview
RetailPulse is a full-stack business intelligence 
dashboard for a retail company operating across 
8 global regions. It covers the complete data 
pipeline from database design to interactive 
visualisation.

## Tech Stack
| Layer      | Technology              |
|------------|-------------------------|
| Database   | PostgreSQL 15           |
| Backend    | Node.js + Express.js    |
| DB Client  | pg-promise              |
| Dashboard  | Power BI Desktop        |

## Features
- Normalised PostgreSQL database with 6 tables
- REST API with 8 analytical endpoints
- Interactive 3-page Power BI dashboard
- KPIs: Revenue, Orders, Customers, Avg Order Value
- Regional and product-level breakdowns
- Monthly sales trend analysis

## Database Schema
6 tables: Regions, Categories, Products, 
Customers, Orders, Order_Items

## API Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /api/sales/total-revenue | Total revenue |
| GET | /api/sales/total-orders | Total orders |
| GET | /api/sales/total-customers | Total customers |
| GET | /api/sales/avg-order-value | Avg order value |
| GET | /api/sales/revenue-by-region | Revenue by region |
| GET | /api/sales/revenue-by-category | Revenue by category |
| GET | /api/sales/top-products | Top 5 products |
| GET | /api/sales/monthly-sales | Monthly trend |

## Dashboard Preview
![Executive Summary](docs/dashboard_page1.png)
![Regional Performance](docs/dashboard_page2.png)
![Product Performance](docs/dashboard_page3.png)

## Grade
O — Outstanding (90-100) | EduSkills Academy
