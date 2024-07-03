# Event Driven Security Templates

## Abstract
In today's fast-paced digital landscape, ensuring robust security while maintaining operational efficiency is paramount. Event Driven Security explores a cutting-edge approach that leverages the synergy of advanced technologies to create a resilient, responsive security framework. The templates provided in this repository will help anyone looking to set up event-driven automation with F5 Products (BIG-IP Classic and BIG-IP Next), utilizing real-time monitoring with either ElasticSearch or Dynatrace. These solutions can be seamlessly integrated to provide event-driven security. By automating security responses, optimizing traffic flow, and gaining deep visibility into ingress and egress traffic, organizations can proactively defend against emerging threats and ensure the integrity of their IT infrastructure.

## What is Provided in this Repository
We provide Rulebooks and Playbooks for Event Driven Automation, which can be implemented using Ansible Automation Platform Controller and Event Driven Ansible. There are at least two different folders containing solutions and integrations delivered at RedHat Events (ElasticSearch and Dynatrace). Additionally, demonstration videos of the solutions in use are provided at the bottom.

## Purpose of this Code
This code is intended for customer use and will assist customers in testing, validating, or even implementing Event Driven Security Solutions with their F5 Products. Multiple monitoring vendors can be implemented with this code, and the solutions provided are examples of what has been directly validated, not limitations to specific products.


## Requirements
- Requires Ansible 2.15 or Higher

- Users also need to include platform collections as per their requirements. The supported platform collections are:
  - [f5networks.f5_bigip](https://github.com/F5Networks/f5-ansible-bigip)
  - [f5networks.f5_modules](https://github.com/F5Networks/f5-ansible)
  - [f5networks.next](https://github.com/F5Networks/f5-ansible-next)

## Execution Environment Available to use
- If you would like to utilize an existing Execution Environment in your Lab for this code its located at 
  - [F5 Ansible EE with Next](https://quay.io/repository/f5_business_development/f5_next_ee_test)
