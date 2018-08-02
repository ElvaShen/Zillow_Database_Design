# Database Design for Zillow Rental Housing Project
## Summary
Zillow.com plans to provide custom solution for university students to search for apartments for rent. Students can look for apartments around the University and book an appointment. They can provide email address to get email confirmation. Zillow asks us to design data model to support this functionality. We have worked with key stakeholders to identify key requirements this database should support. We are required to define minimum data model to support sample use cases in order to capture user interactions. 
### Business Goal
This database provides real-time and accurate housing information for students in their online housing search, particularly for university apartment rental market. The goal is to make students find their desirable apartment faster and more effective in a timely basis, thus optimizing their housing search experience on Zillow.com.

### Business Rules/Assumptions
* While rental property can be independent or can be part of an apartment complex, we will limit to only apartments that are part of a complex. (apartment communities)
* Assume distance from university, days since posted is available as attributes at appropriate level.

Data Model
<img width="575" alt="data model" src="https://user-images.githubusercontent.com/41976548/43610503-29485c06-965b-11e8-920c-6102561cc6be.png">

## Database Design
Following are our database design process:

* Conceptual Design
    - Create Entity Relationship Diagrams (ERD) for each user view
    - Build a Conceptual Data Model (CDM)
    - Define Business Rules, restrictions and requirements for database
* Logical Design
    - Transform CDM to a set of Third Normal Form (3NF) relations indicating all primary and foreign keys
* Physical Design
    - Create Procrocess Versis Entity Matrix
    - Create Composite Usage Map
    - Analyze key transactions
* Implementation
    - Write DDL statements to create database in SQL language
    - Implement indexing and clustering using the outcome of Physical Design
## Future Potentials
We believe this succint yet efficient database model that we structured for Zillow.com will solve their current problems of high latency of the web searching and loading speed due to large database, which will lead to bad user experience. Furthermore, a high-integrity database model will be helpful for them to track, collect and analyze data along the time. This will optimize students' online housing searching experience, specifically for university apartment rental market. 
