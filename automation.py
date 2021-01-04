#!/usr/bin/env python
# coding: utf-8

# In[4]:


from selenium import webdriver
import time
import boto3

ec2=boto3.client('ec2')
instance_information = ec2.describe_instances()

for reservation in instance_information['Reservations']:
    for instance in reservation['Instances']:
        url = instance['PublicDnsName']
client = boto3.client('rds')
response = client.describe_db_instances()
x=',';
for r in response['DBInstances']:
        db_instance_name = r['Endpoint']
        endpoint = db_instance_name['Address']    



urls = "http://" + url #add http:// before ec2 instance dns





web = webdriver.Chrome() #open chrome
web.get(urls) #openurl of website

time.sleep(2)

Submit = web.find_element_by_xpath('/html/body/div/div/div[1]/form/div[2]/div/input')
Submit.click() # click on continue of step 1

Submit = web.find_element_by_xpath('/html/body/div/div/div[1]/form/div/div[2]/input')
Submit.click() # click on continue of step 2


hname = web.find_element_by_xpath('//*[@id="input-db-hostname"]') #filling hostname endpoint
hname.clear()
hname.send_keys(endpoint)


Password = "shoaib12"
passwd = web.find_element_by_xpath('//*[@id="input-db-password"]')
passwd.send_keys(Password)

Database = "mydb"
db = web.find_element_by_xpath('//*[@id="input-db-database"]')
db.send_keys(Database)



Password = "shoaib12"
passw = web.find_element_by_xpath('//*[@id="input-password"]')
passw.send_keys(Password)

EMail = "skhn7474@gmail.com"
mail = web.find_element_by_xpath('//*[@id="input-email"]')
mail.send_keys(EMail)


Submit = web.find_element_by_xpath('/html/body/div/div/div[1]/form/div/div[2]/input')
Submit.click()

Submit = web.find_element_by_xpath('/html/body/div/div[2]/div/div[2]/a')
Submit.click()

Username = "admin"
uname = web.find_element_by_xpath('//*[@id="input-username"]')
uname.send_keys(Username)


Password = "shoaib12"
passw = web.find_element_by_xpath('//*[@id="input-password"]')
passw.send_keys(Password)


Submit = web.find_element_by_xpath('//*[@id="content"]/div/div/div/div/div[2]/form/div[3]/button/i')
Submit.click()

cross = web.find_element_by_xpath('//*[@id="modal-security"]/div/div/div[1]/button')
cross.click()






