# Proposed System Architecture Diagram on AWS

The solution is implemented on AWS ecosystem. 

1. Images uploaded by customers and from the Kafka stream goes into an AWS S3 bucket.
2. These images are processed with the code that the company's software engineers have written and are hosted on AWS Lambda.
3. The processed images are stored in two AWS S3 bucket:
    (1) Archive: Stored for 7 days for archival purposes
    (2) Processed: To be used for analytics thru Amazon QuickSight