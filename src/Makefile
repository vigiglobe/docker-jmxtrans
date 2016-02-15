NAME	= jmxtrans
REGISTRY= maven.vigiglo.be:5000
ARGS	= 
VERSION	= 1
RUNNING = docker run $(ARGS) $(NAME):$(VERSION)

default: help

help: dockerize
	@echo To run type: $(RUNNING)

dockerize: help
	docker build -t $(NAME):$(VERSION) .
	docker images $(NAME)
run:
	$(RUNNING)
push: dockerize
	docker tag -f $(NAME):$(VERSION) $(REGISTRY)/vigiglobe/$(NAME):$(VERSION)
	docker push $(REGISTRY)/vigiglobe/$(NAME):$(VERSION)

