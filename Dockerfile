FROM quay.io/jupyter/base-notebook

USER root

RUN apt-get update && \
    apt-get install --yes --no-install-recommends build-essential

COPY requirements.txt /tmp/requirements.txt

RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN conda clean -afy && \
    rm -rf /root/.cache/pip && \
    rm -f /tmp/requirements.txt  && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER $NB_USER