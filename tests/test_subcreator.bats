#!/usr/bin/env bats

# Verificar que el script existe y es ejecutable
@test "El script creador.sh existe y tiene permisos de ejecución" {
  [ -f "creador.sh" ]
  [ -x "creador.sh" ]
}

# Comprobar que muestra error si no se ejecuta con parámetros válidos
@test "Muestra error si falta el nombre del subdominio" {
  run ./creador.sh crear
  [ "$status" -ne 0 ]
  [[ "${output}" == *"Error: Falta el nombre del subdominio."* ]]
}

# Comprobar que listar subdominios no genera error
@test "Listar subdominios creados no falla" {
  run ./creador.sh listar_creados
  [ "$status" -eq 0 ]
}

# Comprobar que listar subdominios activos no genera error
@test "Listar subdominios activos no falla" {
  run ./creador.sh listar_activos
  [ "$status" -eq 0 ]
}

