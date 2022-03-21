DOCKER_USER_NAME=jeanflores2c93
CODE_PATH=python-app-example
DOCKER_IMAGE_NAME=$(DOCKER_USER_NAME)/python-app:1.0.0

all: clean build unit-test coverage package publish dockerize push intregration_test

clean:
	@echo CLEAN STEP
	find $(CODE_PATH) -type d -name "*cache" -exec rm -rf {} +
	find $(CODE_PATH) -type f -name "*pyc" -delete
	cd $(CODE_PATH) && rm -rf dist src/keepcodingtest_jeanflores* src/tests/.coverage dist
	python3 -m pip uninstal -r $(CODE_PATH)/requirements.txt -y
	docker rmi $(DOCKER_IMAGE_NAME) --force 2> /dev/null

build:
	@echo build step
	cd $(CODE_PATH) && pip3 install -r requirements.txt

unit-test:
	@echo unit test
	cd $(CODE_PATH)/src/tests && coverage run -m pytest -s -v

coverage:
	@echo coverage
	cd $(CODE_PATH)/src/tests && coverage report -m --fail-under=90

package:
	@echo package
	cd $(CODE_PATH) && python3 -m build

publish:
	@echo PUBLISH STEP
	cd $(CODE_PATH) && python3 -m twine upload dist/* --config-file ~/.pypirc --skip-existing

dockerize:
	@echo docker build
	cd docker && docker build -f Dockerfile -t $(DOCKER_IMAGE_NAME) .

push:
	@echo PUSH-TO-DOCKERHUB
	docker push $(DOCKER_IMAGE_NAME)

intregration_test:
	@echo INTEGRATION_TEST
	docker run --rm $(DOCKER_IMAGE_NAME)