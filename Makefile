.PHONY: all volume pull build push run

all: volume build run

volume:
	docker volume create procoder-home
	#docker volume ls 
	#docker volume inspect procoder-home


build:
	docker buildx build --platform linux/arm64 -t ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latest .

run: 
	docker run --platform linux/arm64 --device /dev/dri -it --rm \
		--mount source=procoder-home,target=/home/procoder \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latet \
		xterm

run_screen:
	docker run --platform linux/arm64 --device /dev/dri -it --rm \
		--mount source=procoder-home,target=/home/procoder \
		-e DISPLAY=${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latest \
		xterm -e screen

pull: 
	docker pull  ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latest

push: 
	docker push ghcr.io/thesystemdevelopmentkit/tutorial-fedora:arm64-latest

help:
	@echo "Available targets:"
	 @echo "    volume : creates procoder-home Docker volume"
	 @echo "    build"
	 @echo "    run"
	 @echo "    pull"
	 @echo "    push"
	 @echo "    all : volume build run"

