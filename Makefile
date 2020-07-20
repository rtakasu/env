build:
	DOCKER_BUILDKIT=1 docker build --ssh default -t dev_env .

run:
	docker run -t dev_env
