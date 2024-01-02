from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import numpy as np
# from tabulate import tabulate

app = FastAPI()

class LinearRegressionInput(BaseModel):
    x_values: str
    y_values: str

@app.post("/linear_regression")
async def linear_regression(input_data: LinearRegressionInput):
    try:
        x = input_data.x_values
        y = input_data.y_values

        X = np.array([float(value) for value in x.split(" ")])
        Y = np.array([float(value) for value in y.split(" ")])
        n = len(X)

        title = ["X", "Y", "XY", "X^2", "Y^2"]
        table = np.column_stack((X, Y))
        new_column = X * Y
        table = np.column_stack((table, new_column))
        new_column = X * X
        table = np.column_stack((table, new_column))
        new_column = Y * Y
        table = np.column_stack((table, new_column))

        ΣX = np.sum(table[:, 0])
        ΣY = np.sum(table[:, 1])
        ΣXY = np.sum(table[:, 2])
        ΣX_2 = np.sum(table[:, 3])
        ΣY_2 = np.sum(table[:, 4])

        new_row = np.sum(table, axis=0)
        table = np.row_stack((table, new_row))

        β1 = round((n * ΣXY - ΣX * ΣY) / (n * ΣX_2 - ΣX * ΣX), 5)
        β0 = round((ΣY - ΣX * β1) / n, 5)
        SST = round(ΣY_2 - (ΣY * ΣY / n), 5)
        SSE = round(ΣY_2 - β0 * ΣY - β1 * ΣXY, 5)

        final_table = table.tolist()

        result = {
            "title":title,
            "table": final_table,
            "equation": f"Y = {β0} + {β1}*X",
            "SST": SST,
            "SSE": SSE,
            "R2": 1 - (SSE / SST),
        }

        return result

    except ValueError as ve:
        raise HTTPException(status_code=400, detail=str(ve))

if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="127.0.0.1", port=8000)