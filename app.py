import os
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

VERSION='1.0.2'
STATIC_PATH=os.getenv('STATIC_PATH')

app = FastAPI()

print(f'simple file server VERSION: {VERSION}')
#app.mount('/static', StaticFiles(directory='/single_data/download/clash_sub'), name='static')
app.mount('/static', StaticFiles(directory=STATIC_PATH), name='static')