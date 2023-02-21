FROM python:3.8.10

RUN apt-get update \
    && apt-get install -y --no-install-recommends

RUN pip install "poetry==1.3.2"

WORKDIR /dbtvault/

# Uncomment to speed up build and cache dependencies
COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false
# RUN poetry install $(test "$YOUR_ENV" == production && echo "--no-dev") --no-interaction --no-ansi
RUN poetry install

COPY dbtvault/ .

# Install dbt dependencies (as specified in packages.yml file)
# Build seeds, models and snapshots (and run tests wherever applicable)
CMD dbt deps && dbt docs generate && dbt run