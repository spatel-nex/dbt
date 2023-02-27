FROM python:3.8.10

RUN apt-get update \
    && apt-get install -y --no-install-recommends

RUN pip install "poetry==1.3.2"

WORKDIR /dbtvault/

COPY poetry.lock pyproject.toml ./

RUN poetry config virtualenvs.create false
# RUN poetry install $(test "$YOUR_ENV" == production && echo "--no-dev") --no-interaction --no-ansi
RUN poetry install

COPY dbtvault/ .

# Install dbt dependencies (as specified in packages.yml file)
# Generate docs and other metadata related artifacts
# Build & run seeds, models and/or snapshots (and run tests wherever applicable)
# Clean logs, target files and any dbt packages generated
CMD dbt deps && dbt docs generate && dbt run && dbt clean