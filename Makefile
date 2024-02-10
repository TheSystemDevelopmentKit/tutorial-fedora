#Commnad to run with local docker
CMD ?= xterm

.PHONY: all volume pull build push run run_screen run_vnc
all: create_volume build run

create_volume:
	docker volume create procoder-home
	#docker volume ls 
	#docker volume inspect procoder-home


build:
	docker build -t ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest .

run: 
	docker run --device /dev/dri -it --rm \
		--mount source=procoder-home,target=/home/procoder \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest \
		$(CMD)

run_screen:
	docker run --device /dev/dri -it --rm \
		--mount source=procoder-home,target=/home/procoder \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-p 5920:5920 \
		ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest \
		xterm -e screen

run_vnc:
	docker run --device /dev/dri -it --rm \
		--mount source=procoder-home,target=/home/procoder \
		-e VNC_GEOMETRY=$(shell xdpyinfo | grep dimensions | awk '{print $$2}') \
		-p 5920:5920 \
		ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest \
		/etc/entrypoint.sh

pull: 
	docker pull  ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest

push: 
	docker push ghcr.io/thesystemdevelopmentkit/tutorial-fedora:latest

help:
	@echo "Available targets:"
	 @echo "    volume : creates procoder-home Docker volume"
	 @echo "    build"
	 @echo "    run"
	 @echo "    pull"
	 @echo "    push"
	 @echo "    all : volume build run"

