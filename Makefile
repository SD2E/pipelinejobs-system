BUILDS = demo-jobs-reactor-app pipelines-manager jobs-manager jobs-indexer jobs-agave-proxy

docs: docs-from-subs docs-sphinx

docs-sphinx:
	cd docs && make html

docs-from-subs:
	bash scripts/stage-docs.sh

clean: clean-docs

clean-docs:
	cd docs && make clean
