# f5-bd-ansible-eda playbooks Validated Content Collection

## Abstract
In today's fast-paced digital landscape, ensuring robust security while maintaining operational efficiency is paramount. Event Driven Security explores a cutting-edge approach that leverages the synergy of advanced technologies to create a resilient, responsive security framework. The templates provided in this repository will help anyone looking to set up event-driven automation with F5 Products (BIG-IP Classic and BIG-IP Next), utilizing real-time monitoring with either ElasticSearch or Dynatrace. These solutions can be seamlessly integrated to provide event-driven security. By automating security responses, optimizing traffic flow, and gaining deep visibility into ingress and egress traffic, organizations can proactively defend against emerging threats and ensure the integrity of their IT infrastructure.

## What is Provided in this Repository
We provide Rulebooks and Playbooks for Event Driven Automation, which can be implemented using Ansible Automation Platform Controller and Event Driven Ansible. There are at least two different folders containing solutions and integrations delivered at RedHat Events (ElasticSearch and Dynatrace). Additionally, demonstration videos of the solutions in use are provided at the bottom.

## Purpose of this Code
This code is intended for customer use and will assist customers in testing, validating, or even implementing Event Driven Security Solutions with their F5 Products. Multiple monitoring vendors can be implemented with this code, and the solutions provided are examples of what has been directly validated, not limitations to specific products.

## Requirements
- Requires Python 3.11 or Higher

- Requires Ansible 2.15 or Higher

- Users also need to include platform collections as per their requirements. The supported platform collections are:
  - [f5networks.f5_bigip](https://github.com/F5Networks/f5-ansible-bigip)
  - [f5networks.f5_modules](https://github.com/F5Networks/f5-ansible)
  - [f5networks.next](https://github.com/F5Networks/f5-ansible-next)

## Execution Environment Available to use
- If you would like to utilize an existing Execution Environment in your Lab for this code its located at 
  - [F5 Ansible EE with Next](https://quay.io/repository/f5_business_development/f5_next_ee_test)

## Monitoring Solution of your Choice

In the provided Integrations, we have provided some code and information on two monitoring solutions (ElasticSearch and Dynatrace) This doesnt inhibit anyone from the monitoring solution of their choice, it just is provided information as an example of integrations

## Installation

To consume this Validated Content from Automation Hub, please ensure that you add the following lines to your ansible.cfg file.

```
[galaxy]
server_list = automation_hub

[galaxy_server.automation_hub]
url=https://cloud.redhat.com/api/automation-hub/
auth_url=https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/token
token=<SuperSecretToken>
```
The token can be obtained from the [Automation Hub Web UI](https://console.redhat.com/ansible/automation-hub/token).

Once the above steps are done, you can run the following command to install the collection.

```
ansible-galaxy collection install 
```

## Use Case

Once installed, you can reference the f5-bd-ansible-eda collection content to import Templates into Ansible Automation Platform Controller to Block IP addresses with BIG-IP or BIG-IP Next.   There are also consumable Rulebooks that can be used and imported with Event Driven Ansible to trigger those playbooks.  There are examples in the Integrations folders that you can use for Integrating Dynatrace or ElasticSearch watchers into the solution.  

Customer needs to forward logging from the BIG-IP (Classic or Next) into the monitoring solution (Use the integrations folders as examples of solutions) the Watcher in the ElasticSearch folder is designed to take in the logging and extract IP addresses from connected clients that come from specific Geolocations (China, North Korea and Russia) and submit them for blocking to the BIG-IP softwares. 

**Note:** that the templates in AAP need to be named what the EDA rulebooks are named, and within the default organization.  if you need you can fork the code and change this to accomidate your environment.  

```yaml
        run_job_template:
          name: "Block IPs"
          organization: "Default"
```

Once Templates are imported and EDA is working and integrated to the template (NOTE: you must have the tickbox in Variables to "Prompt on Launch" for the payload to be passed correctly to AAP), then setting up a webhook from your monitoring solution to trigger the blocked IP with a Payload being sent in the webhook. The Message of the payload must say "Ansible Please Block Some IPs" to trigger these specific webhooks, a second part of the payload should contain the Blocked IP Addresses `event.payload.payload` in a CSV format so that it can be consumed appropriately.

```yaml
  rules:
    - name: Block IPs
      condition: event.payload.message == "Ansible Please Block Some IPs"
      action:
        run_job_template:
          name: "Block IPs"
          organization: "Default"
```

When all is working the F5 will send telemetry to the Monitoring solution, the monitoring solution will make a decision in our integration usecases it will determine Geolocation traffic for China, North Korea and Russia, and when it finds those clients it will take those IP addresses and send a webhook to EDA with the payload and message.  If the message matches, the Ansible Automation Platform Template will trigger and use the payload information to automate and Add Blocked IP addresses to the BIG-IP WAF policy.

## YouTube Video of Code being implemented and used (Prior to it being a Collection)
If you want to see an example of the Code in use see https://www.youtube.com/watch?v=V676EF_bq-4

## License

GNU General Public License v3.0 or later

See [LICENSE](https://github.com/f5devcentral/f5-bd-ansible-eda/blob/main/LICENSE) to see the full text.
