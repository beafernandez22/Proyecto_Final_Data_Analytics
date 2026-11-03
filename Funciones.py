
import pandas as pd


def resumen_temporal_csv(ruta_archivo, columna_fecha="t_dat"):
    """
    Cuenta los registros de un CSV grande y obtiene
    su primera y última fecha leyendo por bloques.
    """

    total_registros = 0
    fecha_minima = None
    fecha_maxima = None

    for bloque in pd.read_csv(
        ruta_archivo,
        usecols=[columna_fecha],
        chunksize=500000
    ):
        total_registros += len(bloque)

        minimo = bloque[columna_fecha].min()
        maximo = bloque[columna_fecha].max()

        if fecha_minima is None or minimo < fecha_minima:
            fecha_minima = minimo

        if fecha_maxima is None or maximo > fecha_maxima:
            fecha_maxima = maximo

    return total_registros, fecha_minima, fecha_maxima


def contar_transacciones_mes(ruta_archivo):
    """
    Cuenta los registros de transacciones por mes
    leyendo un CSV grande por bloques.
    """

    conteo_mensual = pd.Series(dtype="int64")

    for bloque in pd.read_csv(
        ruta_archivo,
        usecols=["t_dat"],
        chunksize=500000
    ):
        # Extraer el año y el mes de cada fecha
        meses = bloque["t_dat"].str[:7]

        # Contar registros por mes en cada bloque
        conteo_bloque = meses.value_counts()

        # Acumular los resultados
        conteo_mensual = conteo_mensual.add(
            conteo_bloque,
            fill_value=0
        )

    return conteo_mensual.sort_index().astype("int64")


def comprobar_relaciones(ruta, ids_clientes, ids_articulos,
                         fecha_inicio, fecha_fin):
    """
    Comprueba si los identificadores de las transacciones
    existen en las tablas de clientes y artículos.
    """

    total = 0
    clientes_no_encontrados = 0
    articulos_no_encontrados = 0

    for bloque in pd.read_csv(
        ruta,
        usecols=["t_dat", "customer_id", "article_id"],
        dtype={"customer_id": "str", "article_id": "str"},
        chunksize=50000
    ):

        # Filtrar el periodo seleccionado
        filtro = (
            (bloque["t_dat"] >= fecha_inicio) &
            (bloque["t_dat"] <= fecha_fin)
        )

        bloque = bloque.loc[filtro]

        # Contar los registros analizados
        total += len(bloque)

       
        # Comprobar identificadores de clientes
        clientes_no_encontrados += sum(
          cliente not in ids_clientes
            for cliente in bloque["customer_id"]
        )

        # Comprobar identificadores de artículos
        articulos_no_encontrados += sum(
          articulo not in ids_articulos
            for articulo in bloque["article_id"]
        )


    return total, clientes_no_encontrados, articulos_no_encontrados
