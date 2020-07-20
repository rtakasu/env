build:
	DOCKER_BUILDKIT=1 docker build --ssh default -t dev_env .

# TODO: Set git username and email
run:
	docker run -it --rm \
    -v $(HOME)/workspace:/workspace \
		--entrypoint tmux \
    -e HOST_USER_ID=$(id -u $USER) \
    -e HOST_GROUP_ID=$(id -g $USER) \
    -v ~/.ssh:/root/.ssh \
   	dev_env
