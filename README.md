# Intention
Use as a bolierplate for working with Wordpress and Docker. Includes Xdebug.

# How to use
1. Install docker.  
https://store.docker.com/search?type=edition&offering=community
0. Git clone to project folder. Remove git folder (if using as a boilerplate).
0. Run `docker-compose up -d` in prefered terminal.
0. Wordpress will be installed in _/app_ folder.
0. Replace, if any, _wp-content_ with your content.
0. Run `composer update` to install thirdparty plugins. Content will be installed in _/app/wp-content/themes|plugins|mu-plugins_. A _/vendor_ folder will be created for composer specific files. Add folder to _.gitignore_ if not already excluded.  
Using ACF? See below.
0. Wait ~30 sec. Access application on http://localhost:8000.
0. Run `docker-compose stop` to stop docker container but keep it for later use. 
0. Run `docker-compose halt` to stop and delete container. **Warning, removes database!**


# Access to database
With MySQL Workbench. https://dev.mysql.com/downloads/workbench/
- Hostname: 127.0.0.1
- Port: 3306
- Username: wordpress
- Password: wordpress  

(Same as settings in Dockerfile)

# ACF
To be able to use composer for downloading ACF plugins. Details: https://github.com/PhilippBaschke/acf-pro-installer
1. Get ACF key from https://www.advancedcustomfields.com/my-account/. Account details in wiki.
0. Rename `.env.example` to `.env` and update value with key.

# Xdebug
1. You need to get the host IP of your computer. A.k.a. the IP where your IDE is running. Type `iconfig` and copy the IP for _DockerNAT_.  
0. Open `docker-compose.yml` and replace **X.X.X.X** next to _XDEBUG_CONFIG_. If running OSX. Use `docker.for.mac.host.internal`.
0. Save and restart docker, `docker-compose up -d --force-recreate --build`
0. Set up your IDE by following these [instructions](https://gist.github.com/dluco-/bbe0feb2e26156eb436a2d5b9d084484).  
Skip the _Set up Trellis_ and _.vscode/launch.json_ parts, 
0. Voilá!

> If get the following error `E: Time-out connecting to client. :-(`, try to disable your windows firewall. It might be that port 9000 is blocked.  
If this helps, allow port 9000 for your prefered IDE.

More info:   
https://gist.github.com/chadrien/c90927ec2d160ffea9c4#debug-your-php-in-docker-with-intellijphpstorm-and-xdebug

# Roadmap
- [ ] Save database on `docker-compose halt`.
- [x] Xdebug settings.
- [x] Update how to use in readme.
- [x] Update access to database in readme.
