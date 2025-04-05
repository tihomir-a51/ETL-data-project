.PHONY: install test lint coverage clean

install:
	pip install -r requirements.txt

test:
	PYTHONPATH=. pytest --cov=dag --cov-fail-under=85

coverage:
	PYTHONPATH=. pytest --cov=dag --cov-report=html

open-coverage:
	@echo "Opening HTML coverage report..."
	@python -c "import webbrowser; webbrowser.open('htmlcov/index.html')"

lint:
	flake8 dag tests || true

clean:
	rm -rf .pytest_cache .coverage htmlcov __pycache__ */__pycache__ .mypy_cache
