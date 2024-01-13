# Set up Node Server with Nginx

First Connect to your server via `ssh`

**Update the package first**
```
sudo apt-get update
```
```
sudo apt-get upgrade
```

**Create User on your server skip if you have already user in my case `nodeuser` is my username**
```
  sudo adduser nodeuser
```
You will get the output like this.
Provide the basic information for the user
```
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for nodeuser
Enter the new value, or press ENTER for the default
	Full Name []: Node User
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] Y
```
**Add user to sudo user**
```
  sudo usermode -aG sudo nodeuser
```


sudo su - nodeuser 


### Install Node and NPM, 
**Here I am install by `Node Version Manager(NVM)`**

All package installation 

sudo apt install nginx certbot python3-certbot-nginx


