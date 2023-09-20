def ingreso_cliente(cedula, conn):
    import pandas as pd
    sql = f"SELECT ingreso FROM UCOM.clientes WHERE documento = {cedula}"
    df = pd.read_sql(sql, conn)
    return df.iloc[0,0]

def na_cliente(cedula, conn):
    import pandas as pd
    sql = f"SELECT nivel_academico FROM UCOM.clientes WHERE documento = {cedula}"
    df = pd.read_sql(sql, conn)
    return df.iloc[0,0]