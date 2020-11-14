import json
from wsgiref.simple_server import make_server

from servidor import config

lista_personas=[
    {"id":"/1","nombre":"Johnny Urdin","Profesion":"Diseñador"},
    {"id":"/2","nombre":"Manuel Benitez","Profesion":"Arquitecto"},
    {"id":"/3","nombre":"Luis Malavida","Profesion":"Ingeniero Civil"},
]

def GET(env,response):
    headers = [('Content-type', 'application/json')]
    response('200 Ok', headers)
    resp={
        "data":lista_personas
    }
    return [bytes(json.dumps(resp), 'utf-8')]

def GET_(env,response):
    headers = [('Content-type', 'application/json')]
    response('200 Ok', headers)
    print()
    print(env)
    result=list(e for e in lista_personas if e['id']  == env['PATH_INFO'])[0]
    resp={
        "data":result
    }
    return [bytes(json.dumps(result), 'utf-8')]

def POST(env,response):
    headers=[('Content-type','application/json POST')]
    response('200 Ok', headers)
    resp={
        'mens':'Servidor Activo'
    }
    return bytes('''<form action="/" method="post" enctype="multipart/form-data">
                  <input type="text" name="description" value="some text">
                  <input type="file" name="myFile">
                  <button type="submit">Submit</button>
                </form>''','utf-8')


def aplication(env,response):
    headers=[('Content-type','application/json')]
    response('200 Ok', headers)
    resp={
        'mens':'Servidor Activo'
    }
    return [bytes(json.dumps(resp),'utf-8')]

servidor=make_server(config.data['HOST'],config.data['PORT'],POST)
servidor.handle_request()