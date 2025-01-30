from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import requests

# Define the input model
class Item(BaseModel):
    TagId: str
    TID: str
    VRN: str

# Initialize the FastAPI app
app = FastAPI()

# Replace with the target API endpoint
TARGET_API_URL = "http://115.247.183.246/tagRequest_bank"  # Change this to your target API URL

@app.post("/tagRequest")
async def send_data(item: Item):
    try:
        payload = item.dict()
        response = requests.post(TARGET_API_URL, json=payload)
        response.raise_for_status()
        return JSONResponse(content=response.json())
    except requests.RequestException as e:
        error_message = f"Error processing item: {str(e)}"
        response_data = {"status": "error","message": error_message}
        return JSONResponse(content=response_data, status_code=500)
    


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=5003, reload=True)
