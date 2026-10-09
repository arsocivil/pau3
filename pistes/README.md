# Pistes

Cada exercici té una pista en LaTeX a `src/<id>.tex`, que es compila a `../data/<id>-p.pdf` (el PDF que mostra la web). Els enunciats (`-e.pdf`) i les solucions (`-s.pdf`) són retalls dels PDF oficials del Departament i no es generen aquí.

| Fitxer | Què és |
|---|---|
| `src/pista.sty` | Preàmbul comú: colors, caixa de pista, capçalera. Un canvi aquí afecta totes les pistes. |
| `src/<id>.tex` | Una pista per exercici. `<id>` és el mateix nom que fa servir la web (`alg-23j-q2`, …). |
| `build.py` | Compila les pistes i copia els PDF a `data/`. |
| `REVISIO.md` | Estat de la revisió de cada pista. |
| `ESTIL.md` | Criteris d'estil per escriure i revisar pistes. |

## Compilar

```bash
python3 pistes/build.py                       # totes les pistes
python3 pistes/build.py geo-25j-q4b alg-23j-q2  # només aquestes
python3 pistes/build.py --png /tmp/prev geo-25j-q4b  # i, a més, una imatge PNG de cada una
```

Si una pista no canvia, el PDF que en surt és idèntic byte a byte (git no hi veu cap canvi).

## Editar a Overleaf

```bash
python3 pistes/build.py --zip pistes-overleaf.zip geo-25j-q4b geo-24j-q6
```

El ZIP conté `pista.sty` i els `.tex` demanats. A Overleaf: *New Project → Upload Project*. Després, el `.tex` modificat s'ha de tornar a copiar a `pistes/src/`.
