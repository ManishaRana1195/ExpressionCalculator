## Problem Statement
As a user, I should be able to post a mathematical expression with its result on the website.    
As a user, I should be able to receive mathematical expression posted by other users.     
As a user, I should be able to load 10 latest expressions posted on the website.

## Assumptions      
The input will only contain expressions and operators like +, -, * and /.      
Not considering associattivity and precendence of operators while evaluating expressions.

## Possible Input
0/20       
20/0        
5+5+10             
5\*5\*5\*5       
5\*10+2-10/10

## Approach
As we know the expression needs to be posted in real time and it needs to be 2- way communication, so my solution makes use of socket programming.
Inititally I tried creating websocket client and server in python. I was successful in running mutli-client message passing application locally. But I was not sure how to create UI in python, so re-created the client using React JS.

I worked on React JS for client and python for Server. I could not successfully deploy it due to message format mismatch. I moved on to React JS and Java for Server. I could not successfully deploy it again because of the same reason. The last option, for me, was to develop a Rails app  which makes use of Action Cable to create a publisher subscriber model between the client and server. In production environment, Rails makes use of Redis for the message passing. Again got a bit stuck while deploying the application.

Finally, after hours of research, was able to deploy Expression Calculator application on Heroku and completed my application development using Rails, action cable and Redis.
