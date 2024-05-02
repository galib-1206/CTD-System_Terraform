# CTMS-system

IUT CSE FEST 2024 Hackathon DevOps Segment Team team_naam_nai

Basically, We developed **Car_Trading_Management_System that includes a range of functionalities such as -
1. Registered Users can apply for Car Trading.
2. Adding and viewing Car post in User Dashboard.
3. Multiple Payment option, Price wise sorting.
4. Using Cloudfront and Amazon S3 for frontend deployment and Amazon CodePipeline and CodeDeploy for backend deployment.
5. Using Route53 for assigning custom DNS, SSL Certificate taken from Certificate Management.
6. Amazon Cloud watch for monitoring, Terraform for infrastructure automation, Application Load Balancer (ELB).
7. Mailing Service (SNS) during Autoscaling and EBS Snapshots Lifecycle for Backup.

# Stage 1

A UI app where users can login and register account. Implement automated testing and deployment pipeline

# Stage 2

Add and View Car post in User dashboard.

# Stage 3

View all the car posts in Home. Automated infrastructure scaling is implemented.

## Here is our solutions:

### Stage 1: Progress

Frontend:A simple frontend UI created with react
Testing: Introduced Unit testing and integration testing with supertest and jest.
Backend: A backend app created with express.js
CI/CD: Frontend CI/CD pipeline created using AWS codePipeline
Git branching: best practices were used to maintain branching
strategy for seamless collaboration and automates testing.

# Git Branching Strategy

Main: Main production branch

Develop: Development branch

QA: Branch for quality assurance test

Stage: Final requirements check before merging to main

Feature: Feature branch for developing multiple features simultaneously

### Stage 2: progress

Infrastructure automation: Introduced infrastructure
automation for more flexibility during deployment

### Stage 3: progress

Implement : UI was updated to show car posts in home.
Infrastructure scaling: Infrastructure was configured to scale automatically during heavy load

## Auto-Scaling Policy

# ScaleUp Policy

CloudWatch Metric :

CpuUtilization

    Rule :

      Average CpuUtilization = 30

    Add Instance = 1

# Final Architure of the system
![alt text](https://github.com/rakib3004/VMS-backend/blob/main/Architecture.png?raw=true)


These are the links for individual repositories

CTD_Frontend: https://github.com/SwarnaIslam/Frontend_DevOps/tree/frontend

CTD_Backend: https://github.com/SwarnaIslam/Backend_DevOps

CTD_Slide: https://docs.google.com/presentation/d/1aKeX0ZUB2nPybSfRaSQCk8AjWAOzebVe6nm27Kx_P1g/edit?usp=sharing

forntend link: https://ctd.projectsbd.me
