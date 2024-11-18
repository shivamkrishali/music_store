# Music Store

## Project Overview

This project explores a music store database to gain insights into customer behavior, sales trends, and popular music genres. By analyzing the provided dataset, we aim to uncover valuable information that can help optimize business strategies and improve customer satisfaction.

## Data Analysis Tasks:

### Customer Analysis:
Identify top-spending customers.
Analyze customer purchase patterns and preferences.
Segment customers based on demographics and purchasing behavior.

### Product Analysis:
Determine the most popular music genres and artists.
Identify best-selling albums and tracks.
Analyze sales trends over time.

### Sales Analysis:
Calculate total sales and revenue.
Analyze sales by product category and customer segment.
Identify peak sales periods and trends.

## Data Model and ER Diagram:
The provided ER diagram illustrates the relationships between different entities in the music store database:
 i<img width="594" alt="schema_diagram" src="https://github.com/user-attachments/assets/3f8516e0-bce7-46e3-8de5-d2e34b9b1726">

* **Customer:** Stores
nformation about customers, including their address, contact details, and purchase history.
* **Employee:** Stores information about employees, including their address, contact details, and job role.
* **Invoice:** Represents a purchase made by a customer, including the date, total amount, and a list of invoice lines.
* **Invoice Line:** Details the items purchased in an invoice, including the product ID, quantity, and price.
* **Track:** Stores information about individual tracks, including the artist, album, genre, and media type.
* **Album:** Stores information about albums, including the artist, title, and track list.
* **Artist:** Stores information about artists.
* **Media Type:** Stores information about different media types (e.g., CD, vinyl, digital).
* **Genre:** Stores information about music genres.
* **Playlist:** Stores information about playlists created by customers.
* **Playlist Track:** Associates tracks with playlists.

## Tools and Techniques:

* **SQL:** Used to query the database and extract relevant information.
* **Data Visualization Tools:** Power BI is used to create visualization.
