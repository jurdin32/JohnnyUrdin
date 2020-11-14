package main

//paquetes:
import (
  "encoding/json" // utilizar la codificacion de json
  "log" // para gestionar errores en el servidor
  "net/http" // manejo de peticiones
  "github.com/gorilla/mux" // manejo de urls
)

//objetos de clase persona:
type Persona struct {
  id string `json:"id,omitempty"` //un id que no sera en blanco
  nombres string `json:"nombres,omitempty"` //nombres completos  que no sera en blanco
  apellidos string `json:"apellidos,omitempty"` // apellidos que seran obligatorios
  direccion *Direccion `json:"direccion,omitempty"` //Apunta a la los objetos Direccion  que sera obligatorio
}

//objeto que creara las direcciones de las personas:
type Direccion struct {
  ciudad string `json:"ciudad,omitempty"`
  departamento string `json:"departamento,omitempty"`
}

var persona []Persona // ARREGLO TIPO PERSONAS SIMULARA LA BASE DE DATOS.

//permite devolver todos los registros en el navegador:
func ObtenerTodasLasPersonas(w http.ResponseWriter, req *http.Request){
	json.NewEncoder(w).Encode(persona)
  }

  
//devuelve una persona espedifica segun el id ingresado por url
func ObtenerPersona(w http.ResponseWriter, req *http.Request){
  params := mux.Vars(req)
  //recorre todos los objetos del arreglo y devolvera el objeto cuyo id coincida con el ingresado
  for _, item := range persona {
    if item.id == params["id"] {
      json.NewEncoder(w).Encode(item)
      return
    }
  }
  // salde del bucle y devuelve los datos:
  json.NewEncoder(w).Encode(&Persona{})
}

//Crea una persona nueva
func CrearPersona(w http.ResponseWriter, req *http.Request){
  params := mux.Vars(req)
  var per Persona
  _ = json.NewDecoder(req.Body).Decode(&per)
  per.id = params["id"]
  persona = append(persona, per)
  json.NewEncoder(w).Encode(persona)

}

//eliminar una persona especifica segun el id ingresado por url
func EliminarPersona(w http.ResponseWriter, req *http.Request) {
  params := mux.Vars(req)
  for index, item := range persona {
    if item.id == params["id"] {
      persona = append(persona[:index], persona[index + 1:]...)
      break
    }
  }
  json.NewEncoder(w).Encode(persona)
}



func main() {
	//enrutador:
  router := mux.NewRouter()
  
  // adding example data
  persona = append(persona, Persona{id: "1", nombres:"Johnny E.", apellidos:"Urdin", direccion:&Direccion{ciudad:"Medellin", departamento:"Medellin"}})
  persona = append(persona, Persona{id: "2", nombres:"Andres E.", apellidos:"Duque", direccion:&Direccion{ciudad:"Medellin", departamento:"Medellin"}})

  // obtiene todas las personas en el arreglo:
  router.HandleFunc("personas/", ObtenerTodasLasPersonas).Methods("GET")

  // devuelve una persona especifica segun el id 
  router.HandleFunc("personas/{id}", ObtenerPersona).Methods("GET")

  router.HandleFunc("personas/{id}", CrearPersona).Methods("POST")

  router.HandleFunc("personas/{id}", EliminarPersona).Methods("DELETE")

  log.Fatal(http.ListenAndServe(":15000", router))
}