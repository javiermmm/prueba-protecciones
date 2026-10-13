#!/bin/bash
# Prueba: con ejemplo.log, contar_errores.sh debe detectar exactamente 2 errores

SALIDA=$(bash ./contar_errores.sh pruebas/ejemplo.log)
echo "$SALIDA"

if echo "$SALIDA" | grep -q "Líneas con error: 2"; then
    echo "PRUEBA SUPERADA"
    exit 0
else
    echo "PRUEBA FALLIDA: se esperaban 2 errores"
    exit 1
fi