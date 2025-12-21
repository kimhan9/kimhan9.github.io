# Devops Philosophy

Devops is a process of improving the application delivery

- Automation
- Quality 
- Continous monitoring
- Continous testing

## SDLC

- Software development lifecycle
- Design, develop, test, deploy

## Philosophy

### Developers should not need to have any access to AWS eventually 

- All monitoring from the hardware level (like CPU, memory and network) to the application level should be exposed through third party tools like Datadog and Logentries.

### No SSH into EC2 instances ever

- The keypair section of AWS EC2 should eventually be empty.
- Disable public IP on EC2 instances and SSH port 22.

### Resource creation should only be done through deployment machines

- Avoid point and click at all cost.
- Everything should be scripted and the script on Github.
- All updates to resources should be done via a git push.
- AWS GUI Console usage is only used to check that the resource has been created.

### Do not roll your own if there is a *-as-a-service that does it

- Reason: I don't want to manage its availability, updating the software, security, and others.
- See below - outdated software is dangerous.

### Always use the latest software version

- Outdated software are dangerous because they might have unresolved security vulnerabilities (remember heartbleed?).
- Always look for software that can update itself or use a *-as-a-service that manages its updates. For OS, look at CoreOS - the only Linux OS that can update itself.

### Prefer alerts to monitoring

- Instead of spending time looking at graphs of errors or CPU usage, we should create alerts that push the information to us instead of having us pull the information or infer from the graph. This makes troubleshooting faster.

### All alerts in one place

- Instead of having alerts go to individual emails or sms, put all alerts to different channels in Slack. People will subscribe to channels that matter to them and will set notification preferences accordingly.
- Reason: I do not want to have to manage the email addresses or phone numbers that the different alerts go to.

### Immutable server pattern

- [Martin Fowler - Immutable Server](https://martinfowler.com/bliki/ImmutableServer.html)
- [From Netflix blog](http://techblog.netflix.com/2016/03/how-we-build-code-at-netflix.html):
    - Our deployment strategy is centered around the Immutable Server pattern. Live modification of instances is strongly discouraged in order to reduce configuration drift and ensure deployments are repeatable from source. Every deployment at Netflix begins with the creation of a new Amazon Machine Image, or AMI. To generate AMIs from source, we created “the Bakery”.
    - We do not use any configuration management systems like Puppet, Chef, Ansible or Saltstack.
    - Devprod parity thus stands here. If you run the same image on your localhost or on AWS, you'll get the same result.

### Servers as cattle not pets

- Only one kind of operating system, everything should run on Docker on top of it.
- At the maximum, there should only be 2 kinds of servers: app servers and deployment servers.
- App servers are servers that run long-running web servers and batch jobs; deployment servers only has aws-cli and does deployments.

### One VPC in one account

- This simplifies a whole lot of things.

### All apps should be [12 factor apps](https://12factor.net/)

- Print out the twelve factor document and use it as a checklist for all apps - actually tick on the different factors.

### DB Access via VPN or internal network

- We don't want our data hacked.

## Container Solution Consideration

These are our considerations when looking for a container solution (example: Kubernetes or ECS):

1. The ability to automatically scale on the container level. (This can be based on CPU Utilization or similar metric)
2. The ability to automatically scale on the VM level for the cluster. (This can be based on CPU Utilization or similar metric)
3. The ability to automatically deploy using a Continuous Delivery pipeline.
4. The ability to get automatic software update both on the cluster manager level as well as the OS level. Fyi, with Google Container Engine, we get Kubernetes software update automatically with zero down time. And we also get OS updates on the VM level automatically.
5. The ability to automatically manage SSL certificates. Our current Google Container Engine solution is not able to do this so we have to look for 3rd party solution to manage certificate.
6. The ability to manually deploy a particular version, or roll back to a particular version.
7. If we could roll things out to some percentage of our customers just like how Route53 does weighted routing.
8. The ability to manually scale the number of containers to anticipate a spike. One example of this is before a Marketing campaign.

## Workflow

We adapted [GitHub flow](https://guides.github.com/introduction/flow/) so there are always two branches in the project, **dev** and **master,** following is an example to show you the flow.

1. You should have a ticket first, assume the ticker is ESP-123
2. Checkout to **dev** branch in PWA
3. Create a new branch called **feature/ESP-123-some-description**
4. Checkout to this new branch, start coding
5. When you finished, create a **pull request** in GitHub, ask to merge into **dev**
6. After someone approved your PR, you can merge it and delete the branch

That's all, then you can go to dev env to test it again. You might wonder when will we merge **dev** to **master** and deploy it to staging, we do it periodically when dev is stable. You can find details

Workflow In sprint planning meeting, we pick up some tickets with PM and include it in the sprint

1. We move to *IN PROGRESS* once we are working on this ticket
2. After we finished it and tested on our local environment, we submit a PR in github and move the ticket to *IN CODE REVIEW*
3. After code review has passed, move to *WAITING* if it's not ready for QA because it's blocked by others (for example, BE haven't deploy API), otherwise assign the ticket to QA and move to *READY FOR QA*
4. QA move to *IN TESTING*
5. QA check this ticket in QA environment and if everything works fine, move to *QA PASS*. If it's small issue, QA can decide when to deploy and move it to *TO PRODUCTION*, otherwise will move ticket to *PM CHECK* and assign to PM.
6. In *IN TESTING* and *PM CHECK*, if it fails, will move ticket to *REOPENED*, just like *TODO* but indicate that we worked on this ticket before but it fails the test so we need to check again.
7. If PM or QA think it's ready for production, then move the ticket to *TO PRODUCTION*, and system will automatically assign this ticket to project lead
8. When project lead see this ticket is in the status *TO PRODUCTION*, will deploy this to production
9. After it's deployed, project lead will move the ticket to *DEPLOYED* which means it's on production, and system will automatically assign the ticket back to QA
10. QA do a quick check on production again, and move the ticket to *CLOSED*

## Naming and Tagging

### Naming Convention

- IBM adopted naming convention include microservice, environment, version (major only), projects
- A Project X, a v2 of a **Test** microservice in the **Prod** env

```
# Application name
msvc-test-v2-prod-protectx
msvc-test-v2-prod
    
# Route
msvc-test-v2-prod-projectx.mybluemix.net
msvc-test-v2-prod.projectx.com
```

### Tag

| Key | Example |
| --- | ------- |
| app | xop, bi, de, blog, helmdall |
| env | dev, staging, qa, prod |
| group | devops, bi, de |

Reference: [AWS Tagging](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)