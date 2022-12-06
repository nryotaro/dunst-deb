all:
	docker build -t dunst-deb:latest .
	docker rm -f sodkeojcodjss
	docker run --name sodkeojcodjss dunst-deb:latest
	docker cp sodkeojcodjss:/root/artifact dunst
	cp -r DEBIAN dunst
	dpkg-deb --build --root-owner-group dunst
clean:
	rm -rf dunst.deb dunst
	docker rm -f sodkeojcodjss
	docker rmi -f dunst-deb:latest
