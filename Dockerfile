# Use Astronomer Runtime base image
FROM quay.io/astronomer/astro-runtime:12.1.1


RUN python -m venv soda_venv && source soda_venv/bin/activate && \ 
    pip install --no-cache-dir soda-core-bigquery==3.0.45

RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --upgrade pip setuptools && \ 
    pip install --no-cache-dir dbt-bigquery==1.6.0 && deactivate
