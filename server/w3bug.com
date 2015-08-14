server {
	listen 80;
	listen [::]:80;

	# SSL configuration
	#
	# listen 443 ssl default_server;
	# listen [::]:443 ssl default_server;

	server_name w3bug.com;

	access_log /var/log/nginx/w3bug.com/access.log;
	error_log  /var/log/nginx/w3bug.com/error.log crit;

	root /var/www/empty;
	try_files nonexistent =404;

	location = / {
		return 302 https://www.w3.org/Bugs/Public/buglist.cgi?component=HTML&order=changeddate%20DESC&product=WHATWG&query_format=advanced&resolution=---;
	}
	location = /robots.txt {
		return 200;
	}
	location = /favicon.ico {
		return 200;
	}
	location ~ ^/\d+/?$ {
		rewrite ^/(\d+)/?$ https://www.w3.org/Bugs/Public/show_bug.cgi?id=$1 redirect;
	}
}
