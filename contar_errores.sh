#!/bin/bash
# contar_errores.sh - Cuenta las lineas con "error" de un fichero de log
# Uso: ./contar_errores.sh fichero.log

LOG="$1"

if [ -z "$LOG" ]; then
    echo "Uso: $0 fichero.log"
    exit 1
fi

if [ ! -f "$LOG" ]; then  
    echo "No existe el fichero: $LOG"
    exit 1
fi

TOTAL=$(wc -l < "$LOG")
ERRORES=$(grep -ci "error" "$LOG")
WARN=$(grep -ciw "warn" "$LOG")

echo "Fichero analizado: $LOG"
echo "Total de líneas: $TOTAL"
echo "Líneas con error: $ERRORES"
echo "Líneas con warning: $WARN"

#RETO - añade al script una línea que muestre también el último error del log.
ULTIMO=$(grep -iw "error" "$LOG" | tail -n 1)
if [ -n "$ULTIMO" ]; then
    echo -e "El último ERROR del log es:\n$ULTIMO"
else
    echo "No hay errores en el log. "
fi
