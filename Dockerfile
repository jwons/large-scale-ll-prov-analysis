FROM jupyter/scipy-notebook:4d9c9bd9ced0

WORKDIR /home/jovyan

RUN git clone https://github.com/jwons/MultilingualProvenanceDebugger \
    && cd MultilingualProvenanceDebugger \
    && python setup.py install

# COPY . /home/jovyan/work

RUN pip install timebudget ray 