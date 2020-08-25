sync:
	cd /srv
	wget -r -e robots=off -l 1 -nd -A 'bugs*.html' https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
build:
	cd /srv
	-docker image rm project1
	docker build -t project1 .
	docker save -o project1.tar project1
deploy:
	cd /srv
	scp project1.tar root@10.0.3.115:/srv
	-ssh root@10.0.3.115 "docker kill project1-container"
	-ssh root@10.0.3.115 "docker container rm project1-container"
	-ssh root@10.0.3.115 "docker image rm project1"
	-ssh root@10.0.3.115 "cd /srv && docker load -i project1.tar && docker run -d -p 80:8080 --name project1-container project1"
