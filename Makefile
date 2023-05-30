SHELL := /bin/bash

train_and_save:
	python lrservice/simple_linear_regr.py

test_batch_api_aws:
	curl -X POST -H 'Content-Type: application/json' -d '[[1],[2],[3],[4]]' http://13.55.50.18:5002/batch
test_stream_api_aws:
	curl -X POST -H 'Content-Type: application/json' -d '[8]' http://13.55.50.18:5002/stream
test_batch_api_local:
	curl -X POST -H 'Content-Type: application/json' -d '[[1],[2],[3],[4]]' http://127.0.0.1:5002/batch
test_stream_api_local:
	curl -X POST -H 'Content-Type: application/json' -d '[8]' http://127.0.0.1:5002/stream

test_gunicorn_local:
	gunicorn --bind 0.0.0.0:5002 main:app

build_image:
	docker image build --tag tyler/lr-service:v1 .

run_container:
	docker run -it --name lr_service_container -p 5002:5002 tyler/lr-service:v1

package:
	python setup.py sdist bdist_wheel

package_upload:
	twine upload dist/*
