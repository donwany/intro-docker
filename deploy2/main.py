from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def home():
    return {"message": "Hello Docker! This is ElbowPay's FastAPI app running in a Docker container."}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=5001)